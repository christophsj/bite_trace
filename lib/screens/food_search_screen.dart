import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/mapper/food_dto_to_food_mapper.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/widgets/food_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class FoodSearchScreen extends ConsumerStatefulWidget {
  const FoodSearchScreen({
    required this.log,
    required this.initialMealIndex,
    super.key,
  });

  final DiaryEntry log;
  final int initialMealIndex;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FoodSearchState();
}

class _FoodSearchState extends ConsumerState<FoodSearchScreen>
    with TickerProviderStateMixin {
  int selectedMealIndex = 0;
  late DiaryEntry log;
  Timer? _debounce;

  final PagingController<int, Food> _pagingController =
      PagingController(firstPageKey: 1);
  final PagingController<int, Food> _recentPagingController =
      PagingController(firstPageKey: 0);

  late final TabController tabCtrl;

  final TextEditingController query = TextEditingController(text: '');

  @override
  void initState() {
    tabCtrl = TabController(length: 3, vsync: this);
    log = widget.log;
    selectedMealIndex = widget.initialMealIndex;
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _recentPagingController.addPageRequestListener((pageKey) {
      _fetchRecentPage(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    _pagingController.dispose();
    _recentPagingController.dispose();
    query.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _cancelDebouncer();
    final ctrl = _getCurrentPagingController();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      if (ctrl == _getCurrentPagingController()) {
        ctrl?.refresh();
      }
    });
  }

  void _cancelDebouncer() {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }
  }

  Future<void> _fetchPage(int pageKey) async {
    if (query.text.isEmpty) {
      _pagingController.appendLastPage([]);
      return;
    }
    try {
      final foodService = ref.read(foodSearchProvider);
      final newItems =
          await foodService.searchFoods(query: query.text, page: pageKey);
      final items = newItems.items
          .map(
            (e) => FoodDtoToFoodMapper.foodDtoToFood(
              e.item,
              e.item.servingSizes[0],
            ),
          )
          .toList();
      if (newItems.items.isEmpty) {
        _pagingController.appendLastPage(items);
      } else {
        _pagingController.appendPage(items, pageKey + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  Future<void> _fetchRecentPage(int pageKey) async {
    try {
      final foodService = ref.read(diaryServiceProvider);
      final newItems = await foodService.getRecentFoods(
        userId: log.id,
        filter: query.text,
        page: pageKey,
      );

      if (newItems.isEmpty) {
        _recentPagingController.appendLastPage(newItems);
      } else {
        _recentPagingController.appendPage(newItems, pageKey + 1);
      }
    } catch (error) {
      _recentPagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              titleSpacing: 1,
              toolbarHeight: 60,
              actions: [
                IconButton(
                  onPressed: () {
                    context.pushRoute(
                      BarcodeScanRoute(
                        log: log,
                        selectedMealIndex: selectedMealIndex,
                      ),
                    );
                  },
                  icon: const Icon(Icons.camera_alt),
                ),
              ],
              title: TextField(
                autofocus: true,
                controller: query,
                onChanged: _onSearchChanged,
                onSubmitted: (value) {
                  _cancelDebouncer();
                  final ctrl = _getCurrentPagingController();
                  ctrl?.refresh();
                },
                decoration: const InputDecoration(
                  hintText: 'Which food are you looking for?',
                  border: OutlineInputBorder(),
                ),
              ),
              bottom: TabBar(
                indicatorColor: Theme.of(context).colorScheme.primary,
                controller: tabCtrl,
                tabs: [
                  ('All', Icons.food_bank),
                  ('Recent', Icons.history),
                  ('Favorite', Icons.favorite),
                ]
                    .map(
                      (e) => Tab(
                        icon: Icon(
                          e.$2,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: tabCtrl,
                children: [
                  _buildPaginatedFoodResult(_pagingController),
                  _buildPaginatedFoodResult(_recentPagingController),
                  const Center(child: Text('Favorite')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  PagingController<int, Food>? _getCurrentPagingController() {
    final ctrl = switch (tabCtrl.index) {
      0 => _pagingController,
      1 => _recentPagingController,
      2 => null,
      (final int _) => throw Exception('Invalid tab index'),
    };
    return ctrl;
  }

  Widget _buildPaginatedFoodResult(PagingController<int, Food> controller) {
    return PagedListView<int, Food>(
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<Food>(
        noItemsFoundIndicatorBuilder: (context) {
          if (query.text.isEmpty) {
            return const Center(
              child: Text('Start typing to search.'),
            );
          }
          return const Center(
            child: Text('No items found.'),
          );
        },
        itemBuilder: (context, food, index) {
          return FoodListTile(
            brandName: food.brandName,
            name: '${food.description} ${food.verified ? '✅' : ''}',
            n: food.nutritionalContents,
            onTap: () async {
              final result = await AutoRouter.of(context).push<DiaryEntry?>(
                FoodDetailsRoute(
                  initialMealIndex: selectedMealIndex,
                  log: log,
                  food: food,
                ),
              );
              if (result != null) {
                log = result;
                query.clear();
              }
            },
            trailingIcon: const Icon(Icons.add),
            onTapTrailing: () async {
              final selectedMeal = log.meals![selectedMealIndex];
              log = await ref
                  .read(diaryServiceProvider)
                  .addFoodsToMeal(log, selectedMeal, [food]);
              ref
                  .read(snackbarServiceProvider)
                  .showBasic('Added ${food.description}');
            },
          );
        },
      ),
    );
  }
}

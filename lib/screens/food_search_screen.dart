import 'dart:async';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/mapper/food_dto_to_food_mapper.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/utils/food_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
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

  late final PagingController<int, Food> _pagingController;
  late final PagingController<GraphQLRequest<PaginatedResult<DiaryEntry>>?,
      Food> _recentPagingController;
  late final PagingController<GraphQLRequest<PaginatedResult<MyMeal>>?, MyMeal>
      _mealsPagingController;

  late final TabController tabCtrl;

  late final TextEditingController query;
  bool disposed = false;

  @override
  void initState() {
    super.initState();
    _pagingController = PagingController(firstPageKey: 1);
    query = TextEditingController(text: '');
    _recentPagingController = PagingController(firstPageKey: null);
    _mealsPagingController = PagingController(firstPageKey: null);

    tabCtrl = TabController(length: 3, vsync: this);
    log = widget.log;
    selectedMealIndex = widget.initialMealIndex;
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    _recentPagingController.addPageRequestListener((pageKey) {
      _fetchRecentPage(pageKey);
    });
    _mealsPagingController.addPageRequestListener((pageKey) {
      _fetchMealPage(pageKey);
    });
  }

  @override
  void dispose() {
    disposed = true;

    tabCtrl.dispose();
    _pagingController.dispose();
    _recentPagingController.dispose();
    _mealsPagingController.dispose();
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
      if (disposed) return;
      if (newItems.items.isEmpty) {
        _pagingController.appendLastPage(items);
      } else {
        _pagingController.appendPage(items, pageKey + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  Future<void> _fetchMealPage(
    GraphQLRequest<PaginatedResult<MyMeal>>? pageKey,
  ) async {
    try {
      final result =
          await ref.read(mealServiceProvider).getMyMeals(next: pageKey);

      final items = result.items
          .where((element) => element != null)
          .cast<MyMeal>()
          .toList();
      if (disposed) return;

      if (result.hasNextResult) {
        _mealsPagingController.appendPage(items, result.requestForNextResult);
      } else {
        _mealsPagingController.appendLastPage(items);
      }
    } catch (error) {
      _mealsPagingController.error = error;
    }
  }

  Future<void> _fetchRecentPage(
    GraphQLRequest<PaginatedResult<DiaryEntry>>? pageKey,
  ) async {
    try {
      final (newItems, nextKey) =
          await ref.read(diaryServiceProvider).getRecentFoods(
                userId: log.id,
                filter: query.text,
                pageKey: pageKey,
              );
      final ids =
          _recentPagingController.itemList?.map((e) => e.foodId).toSet() ?? {};
      final toAdd = newItems.where((e) {
        return !ids.contains(e.foodId);
      }).toList();
      if (disposed) return;

      if (nextKey == null) {
        _recentPagingController.appendLastPage(toAdd);
      } else {
        _recentPagingController.appendPage(toAdd, nextKey);
      }
    } catch (error) {
      _recentPagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
              decoration: InputDecoration(
                hintText: 'Which food are you looking for?',
                fillColor: Theme.of(context).colorScheme.onPrimary,
                border: const OutlineInputBorder(),
              ),
            ),
            bottom: TabBar(
              indicatorColor: Theme.of(context).colorScheme.primary,
              controller: tabCtrl,
              tabs: [
                ('All', Icons.food_bank),
                ('Recent', Icons.history),
                ('Meals', Icons.restaurant_menu),
              ]
                  .map(
                    (e) => Tab(
                      icon: Icon(
                        e.$2,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverFillRemaining(
              child: TabBarView(
                controller: tabCtrl,
                children: [
                  _buildPaginatedFoodResult(_pagingController),
                  _buildPaginatedFoodResult(_recentPagingController),
                  _buildPaginatedMealResult(_mealsPagingController),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  PagingController<dynamic, Food>? _getCurrentPagingController() {
    final ctrl = switch (tabCtrl.index) {
      0 => _pagingController,
      1 => _recentPagingController,
      2 => null,
      (final int _) => throw Exception('Invalid tab index'),
    };
    return ctrl;
  }

  Widget _buildPaginatedFoodResult(PagingController<dynamic, Food> controller) {
    return PagedListView<dynamic, Food>(
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

  Widget _buildPaginatedMealResult(
    PagingController<dynamic, MyMeal> controller,
  ) {
    return PagedListView<dynamic, MyMeal>(
      pagingController: controller,
      builderDelegate: PagedChildBuilderDelegate<MyMeal>(
        noItemsFoundIndicatorBuilder: (context) {
          return const Center(
            child: Text('No meals saved yet :('),
          );
        },
        itemBuilder: (context, meal, index) {
          return FoodListTile(
            name: meal.name,
            onLongPress: () async {
              await ref.read(mealServiceProvider).removeMeal(meal);
              ref
                  .read(snackbarServiceProvider)
                  .showBasic('Removed ${meal.name}');
              controller.refresh();
            },
            n: NutrientsExtension.combine(
              meal.foods
                  .map(
                    (e) => e.nutritionalContents.servingFactor(e.servingFactor),
                  )
                  .toList(),
            ),
            onTap: () async {
              await AutoRouter.of(context).push(
                MyMealDetailsRoute(
                  log: log,
                  meal: meal,
                  selectedMealIndex: selectedMealIndex,
                ),
              );
            },
            trailingIcon: const Icon(Icons.add),
            onTapTrailing: () async {
              final selectedMeal = log.meals![selectedMealIndex];
              log = await ref
                  .read(diaryServiceProvider)
                  .addFoodsToMeal(log, selectedMeal, meal.foods);
              ref.read(snackbarServiceProvider).showBasic('Added ${meal.name}');
            },
          );
        },
      ),
    );
  }
}

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/mapper/food_dto_to_food_mapper.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/widgets/animated_elevated_button.dart';
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
      final newItems =
          await foodService.getRecentFoods(filter: query.text, page: pageKey);

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
                  ('Favorite', Icons.favorite)
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
        itemBuilder: (context, item, index) {
          final n = item.nutritionalContents;
          final multi = item.servingSizes[0].nutritionMultiplier;
          final unit =
              '${item.servingSizes[0].value} ${item.servingSizes[0].unit}';
          final cals =
              '${(item.nutritionalContents.calories * multi).toInt()} calories';
          return Padding(
            padding:
                index == 0 ? EdgeInsets.zero : const EdgeInsets.only(top: 6.0),
            child: ListTile(
              textColor: Theme.of(context).colorScheme.onSurface,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              tileColor: Theme.of(context).colorScheme.surface,
              onTap: () async {
                final result = await AutoRouter.of(context).push<DiaryEntry?>(
                  FoodDetailsRoute(
                    initialMealIndex: selectedMealIndex,
                    log: log,
                    food: item,
                  ),
                );
                if (result != null) {
                  log = result;
                  query.clear();
                }
              },
              title: Text(
                '${item.description} ${item.verified ? '✅' : ''}',
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              subtitle: RichText(
                maxLines: 1,
                text: TextSpan(
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                  children: [
                    TextSpan(
                      text: unit,
                    ),
                    TextSpan(text: ' - $cals'),
                    TextSpan(
                      text: ' ${(n.carbohydrates * multi).toInt()}c ',
                      style: const TextStyle(
                        color: CustomColors.carbColor,
                      ),
                    ),
                    TextSpan(
                      text: '${(n.fat * multi).toInt()}f ',
                      style: const TextStyle(
                        color: CustomColors.fatColor,
                      ),
                    ),
                    TextSpan(
                      text: '${(n.protein * multi).toInt()}p ',
                      style: const TextStyle(
                        color: CustomColors.proteinColor,
                      ),
                    )
                  ],
                ),
              ),
              trailing: AnimatedElevatedButton(
                onPressed: () async {
                  final selectedMeal = log.meals![selectedMealIndex];
                  log = await ref
                      .read(diaryServiceProvider)
                      .addFoodsToMeal(log, selectedMeal, [item]);
                  ref
                      .read(snackbarServiceProvider)
                      .showBasic('Added ${item.description}');
                },
                icon: const Icon(Icons.add),
                checkColor: Colors.green,
              ),
            ),
          );
        },
      ),
    );
  }

  // Widget _buildDropdown() {
  //   return Builder(
  //     builder: (context) {
  //       final theme = Theme.of(context);
  //       return DropdownButton(
  //         dropdownColor: theme.brightness == Brightness.light
  //             ? theme.colorScheme.primary
  //             : theme.colorScheme.background,
  //         underline: Container(),
  //         value: selectedMealIndex,
  //         items: widget.log.meals!
  //             .map(
  //               (e) => DropdownMenuItem(
  //                 value: e.index,
  //                 child: Text(
  //                   e.name,
  //                   style: TextStyle(
  //                     fontWeight: FontWeight.w400,
  //                     fontSize: 18,
  //                     color: theme.brightness == Brightness.light
  //                         ? theme.colorScheme.onPrimary
  //                         : theme.colorScheme.onSurface,
  //                   ),
  //                 ),
  //               ),
  //             )
  //             .toList(),
  //         onChanged: (i) {
  //           setState(() {
  //             if (i != null) selectedMealIndex = i;
  //           });
  //         },
  //       );
  //     },
  //   );
  // }
}

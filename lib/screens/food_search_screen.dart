import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/dtos/myfitnesspal_api/item.dart';
import 'package:bite_trace/mapper/food_dto_to_food_mapper.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/service/diary_service.dart';
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
  int fetched = 0;
  int selectedMealIndex = 0;
  late DiaryEntry log;
  Timer? _debounce;

  final PagingController<int, FoodApiItem> _pagingController =
      PagingController(firstPageKey: 1);

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
    super.initState();
  }

  @override
  void dispose() {
    tabCtrl.dispose();
    _pagingController.dispose();
    query.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _cancelDebouncer();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      _pagingController.refresh();
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
      fetched += newItems.items.length;

      if (fetched >= newItems.totalResultsCount || newItems.items.isEmpty) {
        _pagingController.appendLastPage(newItems.items);
      } else {
        _pagingController.appendPage(newItems.items, pageKey + 1);
      }
    } catch (error) {
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final diaryService = ref.read(diaryServiceProvider);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              title: TextField(
                autofocus: true,
                controller: query,
                onChanged: _onSearchChanged,
                onSubmitted: (value) {
                  _cancelDebouncer();
                  _pagingController.refresh();
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
                  _buildFoodSearch(diaryService),
                  const Center(child: Text('Recent')),
                  const Center(child: Text('Favorite')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodSearch(DiaryService diaryService) {
    return PagedListView<int, FoodApiItem>(
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<FoodApiItem>(
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
          final n = item.item.nutritionalContents;
          final multi = item.item.servingSizes[0].nutritionMultiplier;
          final unit =
              '${item.item.servingSizes[0].value} ${item.item.servingSizes[0].unit}';
          final cals =
              '${(item.item.nutritionalContents.energy?.value ?? 0 * multi).toInt()} ${item.item.nutritionalContents.energy?.unit ?? 'calories'}';
          return Padding(
            padding: const EdgeInsets.only(top: 6.0),
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
                    food: FoodDtoToFoodMapper.foodDtoToFood(
                      item.item,
                      item.item.servingSizes[0],
                    ),
                  ),
                );
                if (result != null) {
                  log = result;
                }
              },
              title: Text(
                '${item.item.description} ${item.item.verified ? '✅' : ''}',
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
                  log = await diaryService.addFoodsToMeal(log, selectedMeal, [
                    FoodDtoToFoodMapper.foodDtoToFood(
                      item.item,
                      item.item.servingSizes[0],
                    )
                  ]);
                  ref
                      .read(snackbarServiceProvider)
                      .showBasic('Added ${item.item.description}');
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

  Builder _buildDropdown() {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);
        return DropdownButton(
          dropdownColor: theme.brightness == Brightness.light
              ? theme.colorScheme.primary
              : theme.colorScheme.background,
          underline: Container(),
          value: selectedMealIndex,
          items: widget.log.meals!
              .map(
                (e) => DropdownMenuItem(
                  value: e.index,
                  child: Text(
                    e.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: theme.brightness == Brightness.light
                          ? theme.colorScheme.onPrimary
                          : theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              )
              .toList(),
          onChanged: (i) {
            setState(() {
              if (i != null) selectedMealIndex = i;
            });
          },
        );
      },
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/constants.dart';
import 'package:bite_trace/dtos/myfitnesspal_api/item.dart';
import 'package:bite_trace/mapper/food_dto_to_food_mapper.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/widgets/app_bar_with_meal_selector.dart';
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

class _FoodSearchState extends ConsumerState<FoodSearchScreen> {
  int fetched = 0;
  int selectedMealIndex = 0;

  final PagingController<int, FoodApiItem> _pagingController =
      PagingController(firstPageKey: 1);

  final TextEditingController query = TextEditingController(text: '');

  @override
  void initState() {
    selectedMealIndex = widget.initialMealIndex;
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
    super.initState();
  }

  Future<void> _fetchPage(int pageKey) async {
    if (query.text.isEmpty) {
      _pagingController.appendLastPage([]);
      return;
    }
    try {
      final foodService = ref.read(foodServiceProvider);
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
      appBar: AppBarWithMealSelector(
        selectedMealIndex: selectedMealIndex,
        meals: widget.log.meals!..sort((a, b) => a.index.compareTo(b.index)),
        onChanged: (i) {
          setState(() {
            if (i != null) selectedMealIndex = i;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              autofocus: true,
              controller: query,
              onSubmitted: (value) => _pagingController.refresh(),
              decoration: const InputDecoration(
                hintText: 'Which food are you looking for?',
                border: OutlineInputBorder(),
              ),
            ),
            Expanded(
              child: PagedListView<int, FoodApiItem>(
                pagingController: _pagingController,
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                builderDelegate: PagedChildBuilderDelegate<FoodApiItem>(
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
                          final food = await AutoRouter.of(context).push<Food?>(
                            FoodDetailsRoute(
                              initialMealIndex: selectedMealIndex,
                              log: widget.log,
                              food: FoodDtoToFoodMapper.foodDtoToFood(
                                item.item,
                                item.item.servingSizes[0],
                              ),
                            ),
                          );
                          if (food != null) {
                            ref
                                .read(snackbarServiceProvider)
                                .showBasic('Added ${food.description}');
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
                        trailing: IconButton(
                          onPressed: () async {
                            final selectedMeal =
                                widget.log.meals![selectedMealIndex];
                            await diaryService
                                .addFoodsToMeal(widget.log, selectedMeal, [
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
                          style: IconButton.styleFrom(
                            minimumSize: const Size(30, 30),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}

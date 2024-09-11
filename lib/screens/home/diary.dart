import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:bite_trace/utils/food_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/utils/nutrient_goals_extension.dart';
import 'package:bite_trace/widgets/dashboard.dart';
import 'package:bite_trace/widgets/error_view.dart';
import 'package:bite_trace/widgets/food_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Diary extends ConsumerStatefulWidget {
  const Diary(this.accountData, {super.key});

  final AccountData accountData;

  static const futureDays = 10;

  static DateTime idxToDate(int index) {
    return DateTime.now()
        .subtract(Duration(days: index - futureDays))
        .atMidday();
  }

  static int dateToIdx(DateTime next) {
    return (DateTime.now().atMidday().difference(next.atMidday()).inHours / 24)
            .round() +
        futureDays;
  }

  @override
  ConsumerState<Diary> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends ConsumerState<Diary> {
  final _pageController = PageController(initialPage: Diary.futureDays);

  @override
  void initState() {
    _pageController.addListener(() {
      final date = Diary.idxToDate(_pageController.page!.round());
      if (ref.read(selectedDayProvider) != date) {
        ref.read(selectedDayProvider.notifier).state = date;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(selectedDayProvider, (previous, next) {
      // print('Current page: ${_pageController.page!}');
      // print('requesteed page: ${Diary.dateToIdx(next)}');
      // print(next);
      // print('');
      if (_pageController.page!.round() == Diary.dateToIdx(next)) return;
      _pageController.jumpToPage(
        Diary.dateToIdx(next),
      );
    });
    final dateRange = ref.watch(dateRangeProvider);

    final itemCount = dateRange[1].difference(dateRange[0]).inDays + 1;
    return PageView.builder(
      reverse: true,
      controller: _pageController,
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final diaryState = ref.watch(diaryProvider);
        final date = Diary.idxToDate(index);
        final entryState = diaryState.getEntry(widget.accountData.id, date);
        if (entryState != null) {
          if (entryState.hasError) {
            return ErrorView(error: entryState.error!);
          }
          if (entryState.entry == null) {
            return const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            );
          }
          return RefreshIndicator(
            onRefresh: () => ref.read(diaryServiceProvider).getLog(
                  ref.read(selectedDayProvider),
                  tryFromCache: false,
                  uid: widget.accountData.id,
                ),
            child: Builder(
              builder: (context) {
                return ListView(
                  children: [
                    DiarySection(entryState.entry!, widget.accountData),
                  ],
                );
              },
            ),
          );
        } else {
          // trigger loading the entry
          ref
              .read(diaryServiceProvider)
              .getLog(date, uid: widget.accountData.id);
          return const Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

class DiarySection extends ConsumerWidget {
  const DiarySection(this.log, this.accountData, {super.key});

  final DiaryEntry log;
  final AccountData accountData;

  NutrientGoals _getCurrentGoals() {
    return getValidGoals(log, accountData);
  }

  static NutrientGoals getValidGoals(DiaryEntry log, AccountData accountData) {
    final day = TemporalDate.fromString(log.day).getDateTime();
    if (log.goals == null) {
      return accountData.nutrientGoal.getCurrentGoal(day);
    } else if (accountData.nutrientGoal.setAt != null &&
        !day.isBefore(accountData.nutrientGoal.setAt!.getDateTime())) {
      return accountData.nutrientGoal.getCurrentGoal(day);
    }
    return log.goals!;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = log.meals!;
    return Column(
      children: [
        Dashboard(
          _getCurrentGoals(),
          meals.map((e) => e.foods).expand((element) => element).toList(),
        ),
        Card(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              final n = NutrientsExtension.combine(
                meal.foods.map((e) {
                  return e.nutritionalContents.servingFactor(e.servingFactor);
                }).toList(),
              );
              return FoodListTile(
                name: meal.name,
                n: n,
                onTap: () {
                  if (meal.foods.isEmpty) {
                    context.pushRoute(
                      FoodSearchRoute(
                        log: log,
                        initialMealIndex: meal.index,
                      ),
                    );
                  } else {
                    context.pushRoute(
                      MealDetailsRoute(
                        userId: accountData.id,
                        log: log,
                        meal: meal,
                      ),
                    );
                  }
                },
                onTapTrailing: () {
                  AutoRouter.of(context).push(
                    FoodSearchRoute(
                      log: log,
                      initialMealIndex: meal.index,
                    ),
                  );
                },
                trailingIcon: const Icon(Icons.add),
              );
            },
          ),
        ),
      ],
    );
  }
}

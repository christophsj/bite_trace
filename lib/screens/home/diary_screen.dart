import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/service/account_service.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:bite_trace/utils/date_time_extension.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/widgets/dashboard.dart';
import 'package:bite_trace/widgets/error_view.dart';
import 'package:bite_trace/widgets/food_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DiaryScreen extends ConsumerStatefulWidget {
  const DiaryScreen({super.key});

  static const futureDays = 10;

  static DateTime idxToDate(int index) {
    return DateTime.now()
        .atMidday()
        .subtract(Duration(days: index - futureDays))
        .atMidday();
  }

  static int dateToIdx(DateTime next) {
    return DateTime.now().atMidday().difference(next).inDays + futureDays;
  }

  @override
  ConsumerState<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends ConsumerState<DiaryScreen> {
  final _pageController = PageController(initialPage: DiaryScreen.futureDays);

  @override
  void initState() {
    _pageController.addListener(() {
      final date = DiaryScreen.idxToDate(_pageController.page!.round());
      if (ref.read(selectedDayProvider) != date) {
        ref.read(selectedDayProvider.notifier).state = date;
      }
    });
    super.initState();
  }

  Widget _onUserDataReady(AccountData data) {
    ref.listen(selectedDayProvider, (previous, next) {
      safePrint('Listen fired');
      if (_pageController.page!.round() == DiaryScreen.dateToIdx(next)) return;
      _pageController.jumpToPage(
        DiaryScreen.dateToIdx(next),
      );
    });
    final diaryState = ref.watch(diaryProvider);
    return PageView.builder(
      reverse: true,
      controller: _pageController,
      itemBuilder: (context, index) {
        final date = DiaryScreen.idxToDate(index);
        final entryState = diaryState.getEntry(date);
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
                ),
            child: ListView(
              children: [
                DiarySection(entryState.entry!, data),
              ],
            ),
          );
        } else {
          // trigger loading the entry
          ref.read(diaryServiceProvider).getLog(date);
          return const Center(
            child: SizedBox(
              height: 40,
              width: 40,
              child: CircularProgressIndicator(),
            ),
          );
        }
        // return switch (diaryState) {
        //   (DiaryStateInitializing _) => const Center(
        //       child: SizedBox(
        //         height: 40,
        //         width: 40,
        //         child: CircularProgressIndicator(),
        //       ),
        //     ),
        //   (final DiaryStateError s) => ErrorView(error: s.error!),
        //   (final DiaryStateReady s) => RefreshIndicator(
        //       onRefresh: () => ref
        //           .read(diaryServiceProvider)
        //           .getLog(ref.read(selectedDayProvider)),
        //       child: ListView(
        //         children: [
        //           DiarySection(s.log, data),
        //         ],
        //       ),
        //     ),
        //};
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final accountState = ref.read(accountStateProvider);
    return switch (accountState) {
      (AccountStateInitializing _) => const Center(
          child: SizedBox(
            height: 40,
            width: 40,
            child: CircularProgressIndicator(),
          ),
        ),
      (final AccountStateError s) => ErrorView(error: s),
      (final AccountStateReady s) => _onUserDataReady(s.data)
    };
  }
}

class DiarySection extends ConsumerWidget {
  const DiarySection(this.log, this.data, {super.key});

  final DiaryEntry log;
  final AccountData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meals = log.meals!;
    return Column(
      children: [
        Dashboard(
          data,
          meals.map((e) => e.foods).expand((element) => element).toList(),
        ),
        Card(
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: meals.length,
            itemBuilder: (context, index) {
              final meal = meals[index];
              final color = Theme.of(context).colorScheme.secondary;
              final n = NutrientsExtension.combine(
                meal.foods.map((e) {
                  final serving = e.servingSizes[e.chosenServingSize];
                  return e.nutritionalContents.servingFactor(
                    serving.nutritionMultiplier * e.chosenServingAmount,
                  );
                }).toList(),
              );
              return FoodListTile(
                name: meal.name,
                color: color,
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
                    context.pushRoute(MealDetailsRoute(log: log, meal: meal));
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

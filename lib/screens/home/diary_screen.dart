import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/state/diary_state.dart';
import 'package:bite_trace/utils/nutrient_extension.dart';
import 'package:bite_trace/widgets/async_value_builder.dart';
import 'package:bite_trace/widgets/dashboard.dart';
import 'package:bite_trace/widgets/diary_calendar.dart';
import 'package:bite_trace/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class DiaryScreen extends ConsumerStatefulWidget {
  const DiaryScreen({super.key});

  @override
  ConsumerState<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends ConsumerState<DiaryScreen> {
  @override
  void initState() {
    ref.read(diaryServiceProvider).getLog(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.read(accountDataProvider);
    return AsyncValueBuilder(
      data,
      ondata: (accountData) {
        final diaryState = ref.watch(diaryProvider);

        return switch (diaryState) {
          (DiaryStateInitializing _) => const Center(
              child: SizedBox(
                height: 40,
                width: 40,
                child: CircularProgressIndicator(),
              ),
            ),
          (final DiaryStateError s) => ErrorView(error: s),
          (final DiaryStateReady s) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Card(child: DiaryCalendar()),
                  DiarySection(s.log, accountData!),
                ],
              ),
            ),
        };
      },
    );
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
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: meals.length,
            separatorBuilder: (c, i) => Divider(
              color: Theme.of(context).colorScheme.secondary,
              endIndent: 20,
              indent: 20,
              height: 1,
            ),
            itemBuilder: (context, index) {
              final meal = meals[index];
              final color = Theme.of(context).colorScheme.primary;
              final n = NutrientsExtension.combine(
                meal.foods.map((e) => e.nutritionalContents).toList(),
              );
              return ListTile(
                onTap: () {
                  context.pushRoute(MealDetailsRoute(log: log, meal: meal));
                },
                leading: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.local_fire_department_sharp,
                      color: color,
                      size: 30,
                    ),
                    Text(
                      '${n.calories.toInt()}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: color,
                      ),
                    ),
                  ],
                ),
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  meal.name,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  '${n.carbohydrates.toInt()}g carbs ${n.fat.toInt()}g fat ${n.protein.toInt()}g protein',
                ),
                trailing: ElevatedButton(
                  onPressed: () {
                    AutoRouter.of(context).push(
                      FoodSearchRoute(
                        log: log,
                        initialMealIndex: meal.index,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: const Size(34, 34),
                    padding: EdgeInsets.zero,
                  ),
                  child: const Icon(Icons.add),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

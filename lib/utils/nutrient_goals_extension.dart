import 'package:bite_trace/models/ModelProvider.dart';

extension NutrientGoalsExtension on NutrientGoals {
  bool get valid {
    return carbPerc + fatPerc + proteinPerc == 100;
  }
}

extension NutrientGoalExtension on NutrientGoal {
  NutrientGoals getCurrentGoal(DateTime date) {
    if (isDailyGoal()) {
      return daily;
    }
    return getWeeklyGoal(date.weekday - 1);
  }

  bool isDailyGoal() {
    return isDaily;
  }

  List<NutrientGoalsConfig> getWeeklyGoals() {
    final days = weekly.map((e) => e.days).expand((e) => e ?? <int>[]).toList();

    final List<int> difference =
        {0, 1, 2, 3, 4, 5, 6}.toSet().difference(days.toSet()).toList();
    if (difference.isNotEmpty) {
      if (weekly.isEmpty) {
        weekly.add(
          NutrientGoalsConfig(
            name: 'Default',
            goals: daily,
            days: difference,
          ),
        );
      } else {
        weekly.last.days!.addAll(difference);
      }
    }
    return weekly;
  }

  NutrientGoals getWeeklyGoal(int weekdayIndex) {
    return weekly
            .where((element) => element.days!.contains(weekdayIndex))
            .firstOrNull
            ?.goals ??
        daily;
  }
}

import 'package:bite_trace/models/NutrientGoals.dart';

extension NutrientGoalsExtension on NutrientGoals {
  bool get valid {
    return carbPerc + fatPerc + proteinPerc == 100;
  }
}

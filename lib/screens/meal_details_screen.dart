import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/routing/router.gr.dart';
import 'package:bite_trace/service/diary_service.dart';
import 'package:bite_trace/widgets/copy_meal_dialog.dart';
import 'package:bite_trace/widgets/meal_details.dart';
import 'package:bite_trace/widgets/save_meal_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class MealDetailsScreen extends ConsumerWidget {
  MealDetailsScreen({
    required this.userId,
    required this.log,
    super.key,
    required this.meal,
  });

  final DiaryEntry log;
  final Meal meal;
  final String userId;

  final TextEditingController amount = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meal = ref
        .watch(diaryProvider)
        .getEntry(userId, TemporalDate.fromString(log.day).getDateTime())!
        .entry!
        .meals![this.meal.index];

    final foods = meal.foods;
    return MealDetails(
      log: log,
      onFoodDelete: (int f) => onDeleteFood(ref, meal, f),
      onTapFood: (Food f, int i) => onTapFood(context, meal, f, i),
      name: meal.name,
      foods: foods,
      actions: _actions(context, meal, ref),
    );
  }

  Future<DiaryEntry> onDeleteFood(WidgetRef ref, Meal meal, int food) async {
    return await ref.read(diaryServiceProvider).editFoodInMeal(
          log,
          meal,
          food,
        );
  }

  Future<Object?> onTapFood(
    BuildContext context,
    Meal meal,
    Food food,
    int foodIdx,
  ) {
    return AutoRouter.of(context).push<DiaryEntry?>(
      FoodDetailsRoute(
        initialMealIndex: meal.index,
        log: log,
        food: food,
        foodIdx: foodIdx,
      ),
    );
  }

  List<Widget> _actions(BuildContext context, Meal meal, WidgetRef ref) {
    return [
      IconButton(
        onPressed: () => context.pushRoute(
          FoodSearchRoute(
            log: log,
            initialMealIndex: meal.index,
          ),
        ),
        icon: Icon(
          Icons.add,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
      IconButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (c) => SaveMealDialog(meal, userId: userId),
          );
        },
        icon: const Icon(Icons.save),
      ),
      IconButton(
        onPressed: () async => _openCopyMealPopup(
          context,
          ref.read(authProvider).authUser!.userId,
        ),
        icon: Icon(
          Icons.copy,
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      ),
    ];
  }

  Text header(String s) {
    return Text(
      s,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    );
  }

  String displayForGrams(double? item) {
    if (item == null) {
      return 'N/A';
    }
    return '${item}g';
  }

  void _openCopyMealPopup(BuildContext context, String userId) {
    showDialog(
      context: context,
      builder: (c) => CopyMealDialog(
        meal,
        fromTime: TemporalDate.fromString(log.day).getDateTime(),
        userId: userId,
      ),
    );
  }
}

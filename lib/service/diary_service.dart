import 'dart:async';

import 'package:bite_trace/constants.dart';
import 'package:bite_trace/exceptions.dart';
import 'package:bite_trace/models/daily_log.dart';
import 'package:bite_trace/models/food.dart';
import 'package:bite_trace/models/meal.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/state/diary_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final diaryProvider = StateNotifierProvider<DiaryService, DiaryState>((ref) {
  final s = ref.watch(diaryServiceProvider);
  return s;
});

class DiaryService extends StateNotifier<DiaryState> {
  DiaryService({FirebaseFirestore? firestore, required this.ref})
      : _firestore = firestore ?? FirebaseFirestore.instance,
        super(const DiaryState.initializing()) {
    final auth = ref.read(authServiceProvider);

    init(auth.user);
    userSub = auth.authStateChanges().listen(init);
  }
  final FirebaseFirestore _firestore;
  final Ref ref;
  String? uid;
  late final StreamSubscription<User?> userSub;

  @override
  void dispose() {
    userSub.cancel();
    super.dispose();
  }

  void init(User? user) {
    if (user == null) return;
    uid = user.uid;
    final day = ref.read(selectedDayProvider);
    getLog(day);
  }

  CollectionReference<DailyLog> get diaryCollection {
    final uid = ref.read(authServiceProvider).user?.uid;

    if (uid == null) {
      throw NotAuthorizedException();
    }

    return _firestore.collection('accounts/$uid/diary').withConverter(
          fromFirestore: (snapshot, options) =>
              DailyLog.fromJson({'id': snapshot.id, ...snapshot.data()!}),
          toFirestore: (value, options) => value.toJson(),
        );
  }

  Future<List<DailyLog>> getLogs(DateTime from, DateTime to) async {
    return diaryCollection
        .where('day', isGreaterThanOrEqualTo: from.millisecondsSinceEpoch)
        .where('day', isLessThanOrEqualTo: to.millisecondsSinceEpoch)
        .get()
        .then((value) => value.docs.map((e) => e.data()).toList());
  }

  DateTime dayOf(DateTime dateTime) {
    final now = DateTime.now();
    final date = DateTime(now.year, now.month, now.day);
    return date;
  }

  Future<void> getLog(DateTime date) async {
    state = const DiaryState.initializing();
    try {
      final log = await _getLogFor(dayOf(date));
      state = DiaryState.ready(log);
    } on Exception catch (e) {
      state = DiaryState.error(e.toString());
    }
  }

  Future<DailyLog> _getLogFor(DateTime date) async {
    state = const DiaryState.initializing();
    final res = await diaryCollection
        .where('day', isEqualTo: date.millisecondsSinceEpoch)
        .get();

    if (res.docs.isNotEmpty) {
      return res.docs[0].data();
    }

    return _createLog(date);
  }

  Future<DailyLog> _createLog(DateTime date) async {
    final accountData = await ref.read(accountDataProvider.future);
    final meals = accountData?.mealNames ?? Constants.defaultMealNames;
    final mealsMap = {
      for (final meal in meals.asMap().entries)
        meal.value: Meal(name: meal.value, index: meal.key, foods: [])
    };
    final log = DailyLog(
      day: dayOf(date),
      sortedMeals: DailyLog.sortMeals(mealsMap),
      meals: mealsMap,
      id: diaryCollection.doc().id,
    );
    await diaryCollection.doc(log.id).set(log);
    return log;
  }

  Future<void> addFoodsToMeal(
    DailyLog log,
    Meal mealToAdd,
    List<Food> foods,
  ) async {
    state = const DiaryState.initializing();

    final meal =
        Meal(name: mealToAdd.name, index: mealToAdd.index, foods: foods);

    await diaryCollection.doc(log.id).update({
      'meals.${meal.name}': {
        'name': meal.name,
        'index': meal.index,
        'foods':
            FieldValue.arrayUnion(meal.foods.map((e) => e.toJson()).toList())
      }
    });
    final meals = Map.of(log.meals);
    meals.update(
      meal.name,
      (value) {
        return value.copyWith(foods: [...value.foods, ...meal.foods]);
      },
      ifAbsent: () {
        return meal;
      },
    );
    final sortedMeals = DailyLog.sortMeals(meals);
    state =
        DiaryState.ready(log.copyWith(meals: meals, sortedMeals: sortedMeals));
  }

  Future<void> updateFoods(DailyLog log, String meal, List<Food> foods) async {
    await diaryCollection.doc(log.id).update({
      'meal.$meal.foods': foods.map((e) => e.toJson()).toList(),
    });
  }
}

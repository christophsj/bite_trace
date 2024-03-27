import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MealService {
  MealService({required this.ref}) : super();

  final Ref ref;

  Future<void> removeMeal(MyMeal meal) async {
    try {
      final request = ModelMutations.delete(meal);
      await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic('Failed to delete account.');
    }
  }

  Future<void> addMeal(String name, List<Food> foods) async {
    try {
      final request = ModelMutations.create(
        MyMeal(
          foods: foods,
          name: name,
          accountDataMealsId: ref.read(authProvider).authUser!.userId,
        ),
      );
      await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic('Failed to delete delete.');
    }
  }

  Future<void> update(MyMeal meal) async {
    try {
      final request = ModelMutations.update(
        meal,
      );
      await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic('Failed to update.');
    }
  }

  Future<PaginatedResult<MyMeal>> getMyMeals({
    GraphQLRequest<PaginatedResult<MyMeal>>? next,
  }) async {
    try {
      final request = next ??
          ModelQueries.list(
            MyMeal.classType,
            limit: 10,
            where: MyMeal.ACCOUNTDATAMEALSID
                .eq(ref.read(authProvider).authUser!.userId),
          );
      final response = await Amplify.API.query(request: request).response;
      final data = response.data;

      if (response.hasErrors) {
        ref.read(snackbarServiceProvider).showBasic(response.errors.toString());
        throw Exception('Failed to get meals.');
      }

      return data!;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      rethrow;
    }
  }
}

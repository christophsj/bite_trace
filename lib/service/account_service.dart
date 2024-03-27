import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountService {
  AccountService({required this.ref}) : super();

  final Ref ref;

  Future<AccountData?> createAccount(AccountData accountData) =>
      updateAccount(accountData, create: true);

  Future<void> updateGoals(AccountData old, NutrientGoal nutrientGoal) async {
    final accountData = old.copyWith(
      nutrientGoal: nutrientGoal,
    );
    await updateAccount(accountData);
  }

  Future<AccountData?> updateAccount(
    AccountData accountData, {
    bool create = false,
  }) async {
    try {
      GraphQLRequest request;
      if (create) {
        request = ModelMutations.create(accountData);
      } else {
        request = ModelMutations.update(accountData);
      }
      final result = await Amplify.API.mutate(request: request).response;

      if (result.hasErrors) {
        ref
            .read(snackbarServiceProvider)
            .showBasic('Failed to update account.');
        return null;
      }

      ref.read(authServiceProvider).refreshAccountData(accountData);
      return accountData;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      return null;
    }
  }

  Future<void> deleteAccount(AccountData data) async {
    try {
      final request = ModelMutations.delete(data);
      await Amplify.API.mutate(request: request).response;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic('Failed to delete account.');
    }
  }

  Future<AccountData?> getAccount(String uid) async {
    try {
      final request = ModelQueries.get(
        AccountData.classType,
        AccountDataModelIdentifier(id: uid),
      );
      final response = await Amplify.API.query(request: request).response;
      final accountData = response.data;

      return accountData;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      return null;
    }
  }
}

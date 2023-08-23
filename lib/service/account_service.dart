import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/models/AccountData.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountService {
  AccountService({required this.ref});

  final Ref ref;

  Future<AccountData?> createAccount(AccountData accountData) async {
    try {
      final request = ModelMutations.create(accountData);
      final response = await Amplify.API.mutate(request: request).response;

      final createdTodo = response.data;
      if (createdTodo == null) {
        safePrint('errors: ${response.errors}');
        throw Exception(response.errors);
      }
      return response.data!;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      return null;
    }
  }

  Future<void> updateAccount(AccountData accountData) async {
    try {
      final request = ModelMutations.update<AccountData>(accountData);
      final response = await Amplify.API.mutate(request: request).response;
      safePrint('Response: $response');
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
    }
  }

  Future<AccountData?> getAccount(String uid) async {
    try {
      final request = ModelQueries.get(
        AccountData.classType,
        AccountData.fromJson({'id': uid}).modelIdentifier,
      );
      final response = await Amplify.API.query(request: request).response;
      final todo = response.data;
      if (todo == null) {
        safePrint('errors: ${response.errors}');
      }
      return todo;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      return null;
    }
  }
}

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/models/AccountData.dart';
import 'package:bite_trace/models/ModelProvider.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/state/account_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountStateProvider =
    StateNotifierProvider<AccountService, AccountState>((ref) {
  return ref.watch(accountServiceProvider);
});

class AccountService extends StateNotifier<AccountState> {
  AccountService({required this.ref}) : super(const AccountState.updating());

  final Ref ref;

  Future<AccountData?> createAccount(AccountData accountData) async {
    try {
      final request = ModelMutations.create(accountData);
      final response = await Amplify.API.mutate(request: request).response;

      _handleState(response);
      return response.data;
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
      _handleState(response);
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
    }
  }

  void _handleState(GraphQLResponse<AccountData> response) {
    if (response.data == null) {
      state = AccountState.error(response.errors.toString());
    } else {
      state = AccountState.ready(
        response.data!,
      );
    }
  }

  Future<AccountData?> getAccount(String uid) async {
    try {
      final request = ModelQueries.get(
        AccountData.classType,
        AccountData.fromJson({'id': uid}).modelIdentifier,
      );
      final response = await Amplify.API.query(request: request).response;
      final resp = response.data;
      if (resp == null) {
        safePrint('errors: ${response.errors}');
      }

      _handleState(response);
      return resp;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      state = AccountState.error(e.toString());
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      return null;
    }
  }
}

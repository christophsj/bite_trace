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

  Future<AccountData?> createAccount(AccountData accountData) =>
      updateAccount(accountData);

  Future<AccountData?> updateAccount(AccountData accountData) async {
    try {
      await Amplify.DataStore.save(accountData);
      _handleState(accountData);
      return accountData;
    } on ApiException catch (e) {
      safePrint('Mutation failed: $e');
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      state = AccountState.error(e.message);
      return null;
    }
  }

  void _handleState(AccountData response) {
    state = AccountState.ready(
      response,
    );
  }

  Future<AccountData?> getAccount(String uid) async {
    try {
      final result = await Amplify.DataStore.query(
        AccountData.classType,
        where: AccountData.MODEL_IDENTIFIER.eq(
          AccountDataModelIdentifier(
            id: uid,
          ),
        ),
      );
      final response = result.first;
      _handleState(response);
      return response;
    } on ApiException catch (e) {
      safePrint('Query failed: $e');
      state = AccountState.error(e.toString());
      ref.read(snackbarServiceProvider).showBasic(e.toString());
      return null;
    }
  }
}

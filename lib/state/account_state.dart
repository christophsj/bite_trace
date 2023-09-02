import 'package:bite_trace/models/ModelProvider.dart';

sealed class AccountState {
  const factory AccountState.updating() = AccountStateInitializing;
  const factory AccountState.ready(AccountData data) = AccountStateReady;
  const factory AccountState.error(String? errorText) = AccountStateError;

  AccountData? getData();
}

class AccountStateInitializing implements AccountState {
  const AccountStateInitializing();

  @override
  AccountData? getData() {
    return null;
  }
}

class AccountStateReady implements AccountState {
  const AccountStateReady(this.data);

  final AccountData data;

  @override
  AccountData? getData() {
    return data;
  }
}

class AccountStateError implements AccountState {
  const AccountStateError(this.error);
  final String? error;

  @override
  AccountData? getData() {
    return null;
  }
}

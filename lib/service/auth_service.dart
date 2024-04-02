import 'dart:async';

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:bite_trace/models/AccountData.dart';
import 'package:bite_trace/providers.dart';
import 'package:bite_trace/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthService extends StateNotifier<AuthState> {
  AuthService({required this.ref}) : super(AuthState(initializing: true)) {
    _init();
    _subscription = _listen();
  }
  // final Logger _logger = Logger();
  final Ref ref;
  late final StreamSubscription _subscription;

  Future<void> _init() async {
    final user = await _getCurrentUser();
    if (user != null) {
      state = AuthState(user: (user, null), initializing: true);
      final accountData =
          await ref.read(accountServiceProvider).getAccount(user.userId);
      state = AuthState(user: (user, accountData));
    } else {
      state = AuthState();
    }
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  StreamSubscription<AuthHubEvent> _listen() {
    return Amplify.Hub.listen(HubChannel.Auth, (AuthHubEvent event) async {
      if (event.payload == null) {
        state = AuthState();
      } else {
        final accountData = await ref
            .read(accountServiceProvider)
            .getAccount(event.payload!.userId);
        state = AuthState(user: (event.payload!, accountData));
      }
    });
  }

  void refreshAccountData(AccountData accountData) {
    state = AuthState(user: (state.user!.$1, accountData));
  }

  Future<AuthUser?> _getCurrentUser() async {
    final result = await Amplify.Auth.fetchAuthSession();
    if (result.isSignedIn) {
      final user = await Amplify.Auth.getCurrentUser();
      return user;
    }
    return null;
  }

  Future<void> signOut() {
    return Amplify.Auth.signOut();
  }

  Future<void> deleteAccount() async {
    await ref.read(accountServiceProvider).deleteAccount(state.accountData!);
    await Amplify.Auth.deleteUser();
  }

  Future<JsonWebToken> fetchCognitoAuthSession() async {
    final cognitoPlugin = Amplify.Auth.getPlugin(AmplifyAuthCognito.pluginKey);
    final result = await cognitoPlugin.fetchAuthSession();
    final token = result.userPoolTokensResult.value.idToken;
    return token;
  }
}

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:bite_trace/models/ModelProvider.dart';

class AuthState {
  AuthState({this.initializing = false, this.user});
  final (AuthUser, AccountData?)? user;
  final bool initializing;

  bool get isSignedIn => user != null;
  bool get isRegistered => user?.$2 != null;

  AuthUser? get authUser => user?.$1;
  AccountData? get accountData => user?.$2;
}

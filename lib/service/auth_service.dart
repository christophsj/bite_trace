import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginErrorProvider = StateProvider<String?>((ref) {
  return null;
});

class AuthService {
  AuthService({required this.ref});
  // final Logger _logger = Logger();
  final Ref ref;

  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }

  Future<AuthUser?> getCurrentUser() async {
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
}

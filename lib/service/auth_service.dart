import 'package:bite_trace/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final loginErrorProvider = StateProvider<String?>((ref) {
  return null;
});

class AuthService {

  AuthService({FirebaseAuth? auth, required this.ref})
      : _auth = auth ?? FirebaseAuth.instance {
    authStateChanges().listen((event) {
      ref.read(accountDataCreationProvider.notifier).state = null;
    });
  }
  final FirebaseAuth _auth;
  final Logger _logger = Logger();
  final Ref ref;

  User? get user {
    return _auth.currentUser;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password,) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      _logger.e('Error signing in: ${e.message}');
      ref.read(loginErrorProvider.notifier).state = e.message;
      return null;
    }
  }

  Future<User?> registerWithEmailAndPassword(
      String email, String password,) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      _logger.e('Error registering: ${e.message}');
      ref.read(loginErrorProvider.notifier).state = e.message;
      return null;
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Stream<User?> authStateChanges() => _auth.authStateChanges();
}

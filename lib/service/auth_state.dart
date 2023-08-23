import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initializing() = _AuthStateInitializing;
  const factory AuthState.ready(User? user) = _AuthStateReady;
  const factory AuthState.error(String? errorText) = _AuthStateError;
}

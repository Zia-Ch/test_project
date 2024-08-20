// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testproject/enums/auth_status.dart';
import 'package:testproject/models/auth_state.dart';

final authStateProvider =
    StateNotifierProvider<AuthStateController, AuthState>((ref) {
  return AuthStateController();
});

class AuthStateController extends StateNotifier<AuthState> {
  AuthStateController() : super(AuthState.initial());
  final AuthRepository _authRepository = AuthRepository();

  void signIn() async {
    await _authRepository.signIn();
    state = AuthState.authenticated();
  }

  void signOut() async {
    await _authRepository.signOut();
    state = AuthState.unathenticated();
  }

  void signOutThrowsException() async {
    try {
      await _authRepository.signOutThrowsException();
    } catch (_) {
      state = state.copyWith(
        status: AuthStatus.authenticated,
        errorMessage: 'Something went wrong',
        message: 'stillAuthenticated',
      );
    }
  }
}

class AuthRepository {
  AuthRepository();

  Future<bool> signIn() async {
    return true;
  }

  Future<bool> signOut() async {
    return true;
  }

  Future<bool> signOutThrowsException() {
    try {
      throw Exception('Something went wrong');
    } catch (_) {
      throw Exception('Something went wrong');
    }
  }
}

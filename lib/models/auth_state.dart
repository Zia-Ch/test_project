import 'package:testproject/enums/auth_status.dart';

class AuthState {
  final AuthStatus status;
  final String? errorMessage;
  final String message;

  AuthState({
    required this.status,
    this.errorMessage,
    this.message = '',
  });

  factory AuthState.initial() {
    return AuthState(
      status: AuthStatus.initial,
      message: 'Initial',
      errorMessage: null,
    );
  }

  factory AuthState.authenticated() {
    return AuthState(
      status: AuthStatus.authenticated,
      message: 'Authenticated',
      errorMessage: null,
    );
  }

  factory AuthState.unathenticated() {
    return AuthState(
      status: AuthStatus.unathenticated,
      message: 'Unauthenticated',
      errorMessage: 'Something went wrong',
    );
  }

  AuthState copyWith({
    AuthStatus? status,
    String? errorMessage,
    String? message,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage,
      message: message ?? this.message,
    );
  }
}

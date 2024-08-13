import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';
import 'package:equatable/equatable.dart';

abstract class AuthState {
  final bool isLoading;
  final String? isLoadingText;
  const AuthState({required this.isLoading, this.isLoadingText = 'Loading...'});
}

class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized({required super.isLoading});
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;

  AuthStateLoggedIn({
    required this.user,
    required super.isLoading,
  });
}

class AuthStateRegistering extends AuthState {
  final Exception? exception;
  const AuthStateRegistering(
      {required this.exception, required super.isLoading, super.isLoadingText});
}

class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification({required super.isLoading});
}

class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  const AuthStateLoggedOut(
      {required this.exception, required super.isLoading, super.isLoadingText});

  @override
  List<Object?> get props => [exception, isLoading];
}

class AuthStateOnboarding extends AuthState {
  const AuthStateOnboarding({required super.isLoading});
}

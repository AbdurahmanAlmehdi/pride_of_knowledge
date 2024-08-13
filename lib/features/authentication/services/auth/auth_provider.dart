import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';

abstract class AuthProvider {
  Future<void> initialize();
  AuthUser? get currentuser;
  Future<AuthUser> login({
    required String email,
    required String password,
  });
  Future<AuthUser> createuser({
    required String email,
    required String password,
  });
  Future<void> logout();
  Future<void> sendEmailVerification();
}

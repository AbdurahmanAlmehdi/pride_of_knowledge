import 'package:prideofknowledge/features/authentication/services/auth/auth_provider.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';
import 'package:prideofknowledge/features/authentication/services/auth/firebase_auth_provider.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  AuthService({required this.provider});

  factory AuthService.fromFirebase() =>
      AuthService(provider: FirebaseAuthProvider());

  @override
  Future<AuthUser> createuser(
          {required String email, required String password}) =>
      provider.createuser(email: email, password: password);

  @override
  AuthUser? get currentuser => provider.currentuser;

  @override
  Future<void> initialize() => provider.initialize();

  @override
  Future<AuthUser> login({required String email, required String password}) =>
      provider.login(email: email, password: password);
  @override
  Future<void> logout() => provider.logout();

  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
}

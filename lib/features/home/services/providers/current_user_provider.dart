import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';

final currentUserProvider = StateProvider<AuthUser>((ref) {
  return AuthUser(uid: '', isEmailVerified: false);
});

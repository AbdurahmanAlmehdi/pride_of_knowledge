import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_provider.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';

import 'package:prideofknowledge/data/cloud/firebase_cloud_storage.dart'
    show FirebaseCloudStorage;

class CloudUserProvider extends StateNotifier<AuthUser> {
  CloudUserProvider() : super(AuthUser(uid: '', isEmailVerified: false));

  void storeUser(
      {required String fullName,
      required String phoneNum,
      required String username,
      required AuthProvider provider}) async {
    final userCredentials = provider.currentuser;
    if (userCredentials != null) {
      final user = AuthUser(
          fullName: fullName,
          username: username,
          phoneNum: phoneNum,
          uid: userCredentials.uid,
          isEmailVerified: userCredentials.isEmailVerified);
      FirebaseCloudStorage().createUser(user);
      state = user;
    }
  }

  // retrieve user from cloud
  // update user in cloud
  // Deal with exceptions
}

final cloudUserProvider =
    StateNotifierProvider<CloudUserProvider, AuthUser>((ref) {
  return CloudUserProvider();
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/cloud/cloud_exceptions.dart';
import 'package:prideofknowledge/features/authentication/repostitory/local_auth_repository.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_exceptions.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_provider.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';

import 'package:prideofknowledge/data/cloud/firebase_cloud_storage.dart'
    show FirebaseCloudStorage;

class UserProvider extends StateNotifier<AuthUser> {
  final LocalAuthRepository localAuth = LocalAuthRepository();
  UserProvider() : super(AuthUser(uid: '', isEmailVerified: false));

  Future<void> storeUserInFirebase(
      {required AuthUser user, required AuthProvider provider}) async {
    final newUser = AuthUser(
        email: user.email,
        fullName: user.fullName,
        username: user.username,
        phoneNum: user.phoneNum,
        uid: user.uid,
        isEmailVerified: user.isEmailVerified);
    FirebaseCloudStorage().createUser(newUser);
  }

  void storeUserLocal(
      {required AuthProvider provider, required AuthUser user}) {
    final newUser = user;
    if (!localAuth.isStored(user)) {
      localAuth.storeUser(newUser);
      state = newUser;
    }
    state = newUser;
  }

  void updateUserLocal(
      {required AuthProvider provider, required AuthUser user}) {
    final newUser = user;
    if (localAuth.isStored(newUser)) {
      localAuth.updateUser(newUser);
      state = newUser;
    }
    state = newUser;
  }

  void retrieveCurrentUser(AuthProvider provider) {
    final currentUser = provider.currentuser;
    if (currentUser != null) {
      final localUsers = localAuth.getStoredUsers();
      state = localUsers
          .where(
            (user) => user.uid == currentUser.uid,
          )
          .first;
    } else {
      throw UserNotLoggedInException();
    }
  }

  Future<AuthUser> retrieveCurrentUserFirebase(AuthProvider provider) async {
    final currentUser = provider.currentuser;
    if (currentUser != null) {
      final user = await FirebaseCloudStorage().retreiveUser(currentUser);
      state = user;
      return user;
    } else {
      throw CouldNotRetrieveUserCloudException();
    }
  }

  // retrieve user from cloud
  // update user in cloud
  // Deal with exceptions
}

final userProvider = StateNotifierProvider<UserProvider, AuthUser>((ref) {
  return UserProvider();
});

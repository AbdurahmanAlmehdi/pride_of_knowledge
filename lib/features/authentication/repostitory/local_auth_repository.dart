import 'package:get_storage/get_storage.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';

class LocalAuthRepository {
  final GetStorage _storage = GetStorage();
  final usersKey = 'users';

  List<AuthUser> getStoredUsers() {
    final users = _storage.read<List>(usersKey) ?? [];
    return users
        .map(
          (json) => AuthUser.fromJson(json),
        )
        .toList();
  }

  void storeUser(AuthUser user) {
    final users = getStoredUsers();
    if (!users.any(
          (user2) {
            return user2.uid == user.uid;
          },
        ) ||
        users.isEmpty) {
      users.add(user);
      _storage.write(
          usersKey,
          users
              .map(
                (user) => user.toJson(),
              )
              .toList());
    }
  }

  void removeUser(AuthUser user) {
    final users = getStoredUsers();
    if (users.any(
      (user) => user.uid == user.uid,
    )) {
      users.removeWhere(
        (user) => user.uid == user.uid,
      );
      _storage.write(
          usersKey,
          users
              .map(
                (user) => user.toJson(),
              )
              .toList());
    }
  }

  void updateUser(AuthUser user) {
    final users = getStoredUsers();
    users.removeWhere(
      (user) => user.uid == user.uid,
    );
    users.add(user);
    _storage.write(
        usersKey,
        users
            .map(
              (user) => user.toJson(),
            )
            .toList());
  }

  bool isStored(AuthUser user) {
    final users = getStoredUsers();
    return (users.any(
      (user1) {
        return user1.uid == user.uid;
      },
    ));
  }
}

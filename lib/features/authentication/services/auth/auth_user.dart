import 'package:firebase_auth/firebase_auth.dart';

class AuthUser {
  final String uid;
  final String? email;
  final bool isEmailVerified;
  final String? fullName;
  final String? username;
  final String? phoneNum;

  AuthUser(
      {this.fullName,
      this.username,
      this.phoneNum,
      this.email,
      required this.uid,
      required this.isEmailVerified});

  factory AuthUser.fromFirebase(User user) =>
      AuthUser(uid: user.uid, isEmailVerified: user.emailVerified);
}

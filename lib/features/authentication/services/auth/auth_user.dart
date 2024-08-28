import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';

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

  factory AuthUser.fromJson(Map<String, dynamic> json) {
    return AuthUser(
      uid: json['uid'],
      isEmailVerified: true,
      email: json[emailFieldName],
      fullName: json[fullnameFieldName],
      phoneNum: json[phoneNumFieldName],
      username: json[usernameFieldName],
    );
  }
  factory AuthUser.fromFirestore(DocumentSnapshot<Map<String, dynamic>> json) {
    return AuthUser(
      uid: json.id,
      isEmailVerified: true,
      email: json[emailFieldName] ?? 'error',
      fullName: json[fullnameFieldName] ?? 'unknown',
      phoneNum: json[phoneNumFieldName] ?? 'unknown',
      username: json[usernameFieldName] ?? 'unknown',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      emailFieldName: email,
      fullnameFieldName: fullName,
      phoneNumFieldName: phoneNum,
      usernameFieldName: username,
    };
  }
}

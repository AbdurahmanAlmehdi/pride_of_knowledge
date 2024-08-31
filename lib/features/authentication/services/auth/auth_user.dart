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
  final List<String>? purchasedCourses;
  final List<String>? cartItems;
  final int? balance;

  AuthUser(
      {this.fullName,
      this.username,
      this.phoneNum,
      this.email,
      this.purchasedCourses,
      this.cartItems,
      this.balance,
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
      purchasedCourses: json[purchasedCoursesFieldName] ?? [],
      cartItems: json[cartItemsFieldName] ?? [],
      balance: json[balanceFieldName] ?? 0,
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
      balance: (json[balanceFieldName] ?? 0 as num).toInt(),
      purchasedCourses: (json[purchasedCoursesFieldName] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
      cartItems: (json[cartItemsFieldName] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      emailFieldName: email,
      fullnameFieldName: fullName,
      phoneNumFieldName: phoneNum,
      usernameFieldName: username,
      purchasedCoursesFieldName: purchasedCourses,
      cartItemsFieldName: cartItems,
      balanceFieldName: balance,
    };
  }
}

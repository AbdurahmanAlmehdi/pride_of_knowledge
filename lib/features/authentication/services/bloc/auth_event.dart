import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

class AuthEventInitialize extends AuthEvent {
  final WidgetRef ref;
  const AuthEventInitialize(this.ref);
}

class AuthEventLogIn extends AuthEvent {
  final String email;
  final String password;

  const AuthEventLogIn(this.email, this.password);
}

class AuthEventLogOut extends AuthEvent {
  const AuthEventLogOut();
}

class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;
  final String fullName;
  final String phoneNum;
  final String username;

  const AuthEventRegister({
    required this.email,
    required this.password,
    required this.fullName,
    required this.phoneNum,
    required this.username,
  });
}

class AuthEventSendVerification extends AuthEvent {
  const AuthEventSendVerification();
}

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

class AuthEventIsFirstTime extends AuthEvent {
  const AuthEventIsFirstTime();
}

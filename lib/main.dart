import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prideofknowledge/app.dart';
import 'package:prideofknowledge/constants/routes.dart';
import 'package:prideofknowledge/data/cloud/firebase_cloud_storage.dart';
import 'package:prideofknowledge/data/dummy/courses_dummy.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_service.dart';

import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/home/views/profile_view.dart';

import 'package:prideofknowledge/utilities/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage().initStorage;

  runApp(
    BlocProvider(
      create: (context) => AuthBloc(AuthService.fromFirebase()),
      child: ProviderScope(
        child: MaterialApp(
          theme: ATheme.lightTheme,
          routes: {
            profileRoute: (context) => const ProfileView(),
          },
          home: const MyApp(),
        ),
      ),
    ),
  );
}

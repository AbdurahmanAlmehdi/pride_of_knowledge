import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prideofknowledge/app.dart';
import 'package:prideofknowledge/constants/argumets.dart';
import 'package:prideofknowledge/constants/routes.dart';
import 'package:prideofknowledge/data/models/course.dart';

import 'package:prideofknowledge/features/authentication/services/auth/auth_service.dart';

import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/course_detail/views/course_detail_view.dart';
import 'package:prideofknowledge/features/course_list/views/courses_list_view.dart';
import 'package:prideofknowledge/features/creator_details/views/creator_detail_view.dart';
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
          onGenerateRoute: (settings) {
            if (settings.name == coursesDetailRoute) {
              final args = settings.arguments as Course;
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CourseDetailView(course: args),
              );
            } else if (settings.name == coursesListRoute) {
              final args = settings.arguments as Map;
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CoursesListView(
                  courses: args[Arguments.courses],
                  title: args[Arguments.title],
                  showAppBar: args[Arguments.showAppBar] ?? true,
                  showSearch: args[Arguments.showSearch] ?? false,
                ),
              );
            } else if (settings.name == creatorDetailRoute) {
              final args = settings.arguments as Map;
              return PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    CreatorDetailView(
                  creator: args[Arguments.creators],
                ),
              );
            } else {
              return null;
            }
          },
          routes: {
            profileRoute: (context) => const ProfileView(),
          },
          home: const MyApp(),
        ),
      ),
    ),
  );
}

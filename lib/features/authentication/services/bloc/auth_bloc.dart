import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prideofknowledge/data/dummy/courses_dummy.dart';

import 'package:prideofknowledge/features/authentication/services/auth/auth_provider.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_event.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_state.dart';
import 'package:prideofknowledge/data/cloud/firebase_cloud_storage.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final deviceStorage = GetStorage();
  AuthBloc(AuthProvider provider)
      : super(const AuthStateUninitialized(isLoading: true)) {
    on<AuthEventInitialize>(
      (event, emit) async {
        await provider.initialize();
        deviceStorage.writeIfNull('isFirstTime', true);
        if (deviceStorage.read('isFirstTime') == false) {
          final user = provider.currentuser;
          if (user == null) {
            emit(const AuthStateLoggedOut(exception: null, isLoading: false));
          } else if (!user.isEmailVerified) {
            emit(const AuthStateNeedsVerification(isLoading: false));
          } else {
            emit(AuthStateLoggedIn(user: user, isLoading: false));
          }
        } else {
          emit(const AuthStateOnboarding(isLoading: false));
          deviceStorage.write('isFirstTime', false);
        }
      },
    );
    on<AuthEventLogIn>(
      (event, emit) async {
        emit(const AuthStateLoggedOut(
            exception: null,
            isLoading: true,
            isLoadingText: 'Please wait while we log you in...'));
        final email = event.email;
        final password = event.password;
        try {
          final user = await provider.login(email: email, password: password);

          if (!user.isEmailVerified) {
            emit(const AuthStateLoggedOut(exception: null, isLoading: false));
            emit(const AuthStateNeedsVerification(isLoading: false));
          } else {
            emit(const AuthStateLoggedOut(exception: null, isLoading: false));
            emit(AuthStateLoggedIn(user: user, isLoading: false));
          }
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e, isLoading: false));
        }
      },
    );
    on<AuthEventLogOut>(
      (event, emit) async {
        try {
          await provider.logout();
          emit(const AuthStateLoggedOut(exception: null, isLoading: false));
        } on Exception catch (e) {
          emit(AuthStateLoggedOut(exception: e, isLoading: false));
        }
      },
    );
    on<AuthEventSendVerification>(
      (event, emit) async {
        await provider.sendEmailVerification();
        emit(state);
      },
    );
    on<AuthEventRegister>(
      (event, emit) async {
        emit(const AuthStateRegistering(
            exception: null,
            isLoading: true,
            isLoadingText: 'Please Wait For Us To Register You...'));
        final email = event.email;
        final password = event.password;
        final phoneNum = event.phoneNum;
        final username = event.username;
        final fullName = event.fullName;

        try {
          await provider.createuser(email: email, password: password);
          final currentUser = provider.currentuser;
          if (currentUser != null) {
            final user = AuthUser(
              uid: currentUser.uid,
              isEmailVerified: currentUser.isEmailVerified,
              phoneNum: phoneNum,
              username: username,
              fullName: fullName,
            );
            FirebaseCloudStorage().createUser(user);
          }
          await provider.sendEmailVerification();
          emit(const AuthStateNeedsVerification(isLoading: false));
        } on Exception catch (e) {
          emit(AuthStateRegistering(exception: e, isLoading: false));
        }
      },
    );
    on<AuthEventShouldRegister>(
      (event, emit) {
        emit(const AuthStateRegistering(exception: null, isLoading: false));
      },
    );
  }
}

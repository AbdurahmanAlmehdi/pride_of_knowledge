import 'package:bloc/bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:prideofknowledge/features/authentication/providers/user_provider.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_provider.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_user.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_event.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final deviceStorage = GetStorage();
  final _userProvider = UserProvider();
  AuthBloc(AuthProvider provider)
      : super(const AuthStateUninitialized(isLoading: true)) {
    on<AuthEventInitialize>(
      (event, emit) async {
        final ref = event.ref;
        await provider.initialize();
        deviceStorage.writeIfNull('isFirstTime', true);
        if (deviceStorage.read('isFirstTime') == false) {
          final user = provider.currentuser;
          ref.read(userProvider.notifier).retrieveCurrentUser(provider);
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
            final cloudUser =
                await _userProvider.retrieveCurrentUserFirebase(provider);
            _userProvider.storeUserLocal(provider: provider, user: cloudUser);
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
          final currentUser =
              await provider.createuser(email: email, password: password);

          final user = AuthUser(
            uid: currentUser.uid,
            isEmailVerified: currentUser.isEmailVerified,
            phoneNum: phoneNum,
            username: username,
            fullName: fullName,
            email: email,
          );

          await _userProvider.storeUserInFirebase(
              user: user, provider: provider);
          _userProvider.storeUserLocal(provider: provider, user: user);

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

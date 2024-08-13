import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_exceptions.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_state.dart';
import 'package:prideofknowledge/features/authentication/views/widgets/login_form.dart';
import 'package:prideofknowledge/utilities/dialogs/show_error_dialog.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const bool _remember = true;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateLoggedOut) {
          if (state.exception is UserNotFoundAuthException) {
            await showErrorDialog(context, 'User Not Found');
          } else if (state.exception is WrongPasswordAuthException) {
            await showErrorDialog(context, 'Wrong User Credentials');
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, 'Authentication Error');
          }
        }
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            ASizes.defaultSpace,
            ASizes.appBarHeight,
            ASizes.defaultSpace,
            ASizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: Center(
                  child: Image(
                    image: AssetImage(AImages.authLoginImage),
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              const SizedBox(
                height: ASizes.spaceBtwSections,
              ),
              Text(
                'Welcome,',
                style: ATextTheme.bigHeading,
              ),
              const SizedBox(
                height: ASizes.dividerHeight,
              ),
              Text(
                'Sign in to Continue!',
                style: ATextTheme.smallHeading,
              ),
              const SizedBox(
                height: ASizes.spaceBtwSections,
              ),
              const LoginForm(remember: _remember),
            ],
          ),
        ),
      )),
    );
  }
}

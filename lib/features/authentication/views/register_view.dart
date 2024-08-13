import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/features/authentication/services/auth/auth_exceptions.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_state.dart';
import 'package:prideofknowledge/features/authentication/views/widgets/register_form.dart';
import 'package:prideofknowledge/utilities/dialogs/show_error_dialog.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthStateRegistering) {
          if (state.exception is EmailAlreadyInUseAuthException) {
            await showErrorDialog(context, "Email already in use");
          } else if (state.exception is WeakPasswordAuthException) {
            await showErrorDialog(context, "Weak Password");
          } else if (state.exception is InvalidEmailAuthException) {
            await showErrorDialog(context, 'Invalid Email');
          } else if (state.exception is GenericAuthException) {
            await showErrorDialog(context, 'Failed to Create Account');
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
                const Center(
                  child: Image(
                    image: AssetImage(AImages.authRegisterImage),
                    height: 200,
                    width: 200,
                  ),
                ),
                const SizedBox(
                  height: ASizes.spaceBtwSections,
                ),
                Text('Register', style: ATextTheme.bigHeading),
                const SizedBox(
                  height: ASizes.dividerHeight,
                ),
                Text(
                  'Create an account to begin your journey!',
                  style: ATextTheme.smallHeading,
                ),
                const SizedBox(
                  height: ASizes.spaceBtwSections,
                ),
                const RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

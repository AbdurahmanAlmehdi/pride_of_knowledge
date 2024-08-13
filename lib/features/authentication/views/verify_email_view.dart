import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_event.dart';

import 'package:prideofknowledge/features/authentication/views/generics/text_button.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class VerifyEmailView extends StatelessWidget {
  const VerifyEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            ASizes.defaultSpace,
            ASizes.appBarHeight + 40,
            ASizes.defaultSpace,
            ASizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify Email',
                style: ATextTheme.bigHeading,
              ),
              const Center(
                child: Image(
                  image: AssetImage(AImages.authVerifyImage),
                  height: 200,
                  width: 200,
                ),
              ),
              Center(
                child: Text(
                  'Verification Email Sent',
                  style: ATextTheme.mediumHeading,
                ),
              ),
              const SizedBox(
                height: ASizes.spaceBtwItems,
              ),
              Center(
                child: Text(
                  'If you have not receievd the email, Please click the button below',
                  style: ATextTheme.bigBody,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: ASizes.spaceBtwSections,
              ),
              ElevatedTextButton(
                buttonText: 'Send Email Verification',
                onPressed: () {
                  context
                      .read<AuthBloc>()
                      .add(const AuthEventSendVerification());
                },
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    context.read<AuthBloc>().add(const AuthEventLogOut());
                  },
                  child: Text(
                    "Already Verified, Click here",
                    style: ATextTheme.smallSubHeading,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

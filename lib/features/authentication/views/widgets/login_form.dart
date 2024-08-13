import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/features/authentication/providers/form_provider.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_event.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_button.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_field.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:prideofknowledge/utilities/validators/validation.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required bool remember,
  }) : _remember = remember;

  final bool _remember;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  final _formKey = GlobalKey<FormState>();

  void _saveForm() {
    _formKey.currentState!.validate();
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = _email;
    final password = _password;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          GenericTextField(
            controller: email,
            obscureText: false,
            validator: (value) => AValidator.validateEmail(value),
            prefixIcon: Icons.person_outline_rounded,
            labelText: 'Email',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(
            height: ASizes.spaceBtwInputFields,
          ),
          Consumer(
            builder: (context, ref, child) {
              final hidePassword = ref.watch(hidePasswordProvider);
              return GenericTextField(
                controller: password,
                obscureText: hidePassword,
                validator: (value) => AValidator.validatePassword(value),
                prefixIcon: CupertinoIcons.lock,
                suffixIcon: IconButton(
                  onPressed: () {
                    ref.read(hidePasswordProvider.notifier).update(
                          (state) => !state,
                        );
                  },
                  icon: Icon(
                      hidePassword ? Icons.visibility : Icons.visibility_off),
                ),
                labelText: 'Password',
                keyboardType: TextInputType.visiblePassword,
                onTapEye: () {},
              );
            },
          ),
          Row(
            children: [
              Checkbox(
                value: widget._remember,
                onChanged: (value) {},
              ),
              Text(
                'Remember Me',
                style: GoogleFonts.cairo(),
              ),
            ],
          ),
          const SizedBox(
            height: ASizes.spaceBtwInputFields,
          ),
          ElevatedTextButton(
            buttonText: 'Sign In',
            onPressed: () {
              _saveForm();
              context
                  .read<AuthBloc>()
                  .add(AuthEventLogIn(email.text.trim(), password.text.trim()));
            },
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEventShouldRegister());
            },
            child: Text(
              "Don't have an account?, Register Here",
              style: ATextTheme.smallSubHeading,
            ),
          )
        ],
      ),
    );
  }
}

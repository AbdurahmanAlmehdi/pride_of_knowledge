import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/features/authentication/providers/form_provider.dart';

import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_event.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_button.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_field.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:prideofknowledge/utilities/validators/validation.dart';

class RegisterForm extends ConsumerStatefulWidget {
  const RegisterForm({
    super.key,
  });

  @override
  ConsumerState<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends ConsumerState<RegisterForm> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _phoneNum;
  late final TextEditingController _fullName;
  late final TextEditingController _username;
  final _formKey = GlobalKey<FormState>();

  void _saveForm() {
    _formKey.currentState!.validate();
  }

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _phoneNum = TextEditingController();
    _fullName = TextEditingController();
    _username = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _phoneNum.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = _email;
    final phoneNum = _phoneNum;
    final password = _password;
    final fullName = _fullName;
    final username = _username;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          GenericTextField(
            validator: (value) => AValidator.isRequired(value),
            controller: fullName,
            obscureText: false,
            prefixIcon: Icons.person_outline_rounded,
            labelText: 'Full Name',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: ASizes.spaceBtwInputFields,
          ),
          GenericTextField(
            validator: (value) => AValidator.isRequired(value),
            controller: username,
            obscureText: false,
            prefixIcon: Icons.person_outline_rounded,
            labelText: 'Username',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: ASizes.spaceBtwInputFields,
          ),
          GenericTextField(
            validator: (value) => AValidator.validateEmail(value),
            controller: email,
            obscureText: false,
            prefixIcon: Icons.person_outline_rounded,
            labelText: 'Email',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: ASizes.spaceBtwInputFields,
          ),
          GenericTextField(
            controller: phoneNum,
            validator: (value) => AValidator.validatePhoneNum(value),
            obscureText: false,
            prefixIcon: Icons.local_phone,
            labelText: 'Phone Number',
            keyboardType: TextInputType.phone,
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
          const SizedBox(
            height: ASizes.spaceBtwSections,
          ),
          ElevatedTextButton(
            buttonText: 'Register',
            onPressed: () {
              _saveForm();
              context.read<AuthBloc>().add(AuthEventRegister(
                    email: email.text.trim(),
                    password: password.text.trim(),
                    fullName: fullName.text.trim(),
                    username: username.text.trim(),
                    phoneNum: phoneNum.text.trim(),
                  ));
            },
          ),
          TextButton(
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEventLogOut());
            },
            child: Text(
              "Already have an account?, Login Here",
              style: ATextTheme.smallSubHeading,
            ),
          )
        ],
      ),
    );
  }
}

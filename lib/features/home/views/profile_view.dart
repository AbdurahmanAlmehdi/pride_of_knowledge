import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prideofknowledge/features/authentication/services/bloc/auth_bloc.dart';
import 'package:prideofknowledge/features/authentication/services/bloc/auth_event.dart';

import 'package:prideofknowledge/features/authentication/views/generics/text_button.dart';
import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        ElevatedTextButton(
          buttonText: 'Logout',
          onPressed: () {
            context.read<AuthBloc>().add(const AuthEventLogOut());
            ref.read(navigationProvider.notifier).reset();
          },
        )
      ],
    );
  }
}

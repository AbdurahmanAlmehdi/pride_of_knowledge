import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/features/authentication/providers/user_provider.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_button.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_field.dart';
import 'package:prideofknowledge/features/wallet/views/widgets.dart';
import 'package:prideofknowledge/utilities/dialogs/generic_dialog.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:prideofknowledge/utilities/widgets/global_widgets.dart';

class WalletView extends ConsumerWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final balance = ref.watch(userProvider).balance;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wallet',
          style: ATextTheme.appBarTitle,
        ),
      ),
      body: ListView(
        children: [
          Tile(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Current Balance:',
                      style: ATextTheme.bigSubHeading
                          .copyWith(color: AColors.secondary),
                    ),
                    Text(
                      '${balance.toString()} LYD',
                      style: ATextTheme.bigSubHeading,
                    )
                  ]),
            ),
          ),
          Tile(
            height: 350,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Recharge',
                      style: ATextTheme.bigSubHeading
                          .copyWith(color: AColors.secondary),
                    ),
                  ),
                  Form(
                    child: GenericTextField(
                      obscureText: false,
                      controller: TextEditingController(),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Choose Payment Method',
                      style: ATextTheme.mediumSubHeading,
                    ),
                  ),
                  const CheckList(),
                  TextButton(
                      onPressed: () async {
                        await showGenericDialog(
                          context: context,
                          title: 'Prepaid Card',
                          content: GenericTextField(
                            controller: TextEditingController(),
                            labelText: 'Enter Secret Code on Card',
                            obscureText: false,
                          ),
                          optionBuilder: () {
                            return {
                              'Cancel': false,
                              'Submit': true,
                            };
                          },
                        );
                      },
                      child: Text(
                        'Do you have a prepaid Card, Click here',
                        style: ATextTheme.mediumSubHeading
                            .copyWith(color: AColors.primary),
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedTextButton(
              buttonText: 'Add Funds',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}

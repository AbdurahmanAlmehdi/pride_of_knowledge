import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_field.dart';
import 'package:prideofknowledge/features/wallet/views/widgets.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:prideofknowledge/utilities/widgets/global_widgets.dart';

class WalletView extends StatelessWidget {
  const WalletView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Wallet',
          style: ATextTheme.appBarTitle,
        ),
      ),
      body: Column(
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
                      '0.00 DL',
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
                        controller: TextEditingController()),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Choose Payment Method',
                      style: ATextTheme.mediumSubHeading,
                    ),
                  ),
                  const CheckList()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

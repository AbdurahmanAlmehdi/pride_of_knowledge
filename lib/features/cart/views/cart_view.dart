import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: ATextTheme.appBarTitle,
        ),
      ),
    );
  }
}

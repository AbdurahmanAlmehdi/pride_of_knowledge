import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

typedef OnPressed = void Function();

class ElevatedTextButton extends StatelessWidget {
  const ElevatedTextButton(
      {super.key,
      required this.buttonText,
      this.onPressed,
      this.width = 380,
      this.height = 200});

  final String buttonText;

  final OnPressed? onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          textStyle: ATextTheme.buttonText,
          backgroundColor: AColors.buttonSecondary,
          foregroundColor: AColors.light,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(65),
          ),
          elevation: 0,
        ),
        child: Text(buttonText),
      ),
    );
  }
}

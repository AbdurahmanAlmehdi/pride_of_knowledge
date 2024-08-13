import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';

typedef Validator = String? Function(String?)?;
typedef OnTapEye = void Function();

class GenericTextField extends StatelessWidget {
  const GenericTextField({
    super.key,
    this.keyboardType,
    this.suffixIcon,
    this.prefixIcon,
    this.labelText,
    required this.obscureText,
    required this.controller,
    this.validator,
    this.onTapEye,
  });

  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final IconData? prefixIcon;
  final String? labelText;
  final bool obscureText;
  final TextEditingController controller;
  final Validator validator;
  final OnTapEye? onTapEye;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
        ),
        suffixIcon: suffixIcon,
        labelText: labelText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AColors.primary,
              width: 0.0,
            )),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AColors.borderSecondary,
            width: 0.0,
          ),
        ),
      ),
    );
  }
}

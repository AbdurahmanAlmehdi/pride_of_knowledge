import 'package:flutter/material.dart';

import 'package:prideofknowledge/utilities/dialogs/generic_dialog.dart';

Future<void> showErrorDialog(
  BuildContext context,
  String text,
) {
  return showGenericDialog(
    context: context,
    title: 'An Error has occurred',
    content: Text(text),
    optionBuilder: () => {
      'OK': null,
    },
  );
}

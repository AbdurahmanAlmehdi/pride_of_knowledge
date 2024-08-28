import 'package:flutter/material.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CheckList extends StatelessWidget {
  const CheckList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Bank Card',
              style: ATextTheme.smallSubHeading,
            ),
            Checkbox(
              value: false,
              onChanged: (value) {},
              activeColor: Colors.blue,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Sadad',
              style: ATextTheme.smallSubHeading,
            ),
            Checkbox(
              value: false,
              onChanged: (value) {},
              activeColor: Colors.blue,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Prepaid Card',
              style: ATextTheme.smallSubHeading,
            ),
            Checkbox(
              value: false,
              onChanged: (value) {},
              activeColor: Colors.blue,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'MobiCash',
              style: ATextTheme.smallSubHeading,
            ),
            Checkbox(
              value: false,
              onChanged: (value) {},
              activeColor: Colors.blue,
            ),
          ],
        )
      ],
    );
  }
}

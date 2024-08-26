import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class TitleSeeAllRow extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  const TitleSeeAllRow({
    super.key,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: ATextTheme.bigSubHeading,
          ),
          Consumer(
            builder: (context, ref, child) {
              return TextButton(
                onPressed: onPressed,
                child: Text(
                  'See All',
                  style: ATextTheme.mediumSubHeading,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

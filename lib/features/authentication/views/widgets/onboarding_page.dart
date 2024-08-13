import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(ASizes.defaultSpace),
      child: Column(
        children: [
          Image(
            width: AHelperFunctions.screenWidth(context) * 0.8,
            height: AHelperFunctions.screenHeight(context) * 0.5,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: ATextTheme.mediumHeading.copyWith(color: AColors.secondary),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: ASizes.spaceBtwItems + 10,
          ),
          Text(
            subtitle,
            style: ATextTheme.mediumSubHeading.copyWith(color: AColors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

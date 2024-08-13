import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/constants/text_strings.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CarouselSlide extends StatelessWidget {
  const CarouselSlide({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color.fromARGB(255, 70, 78, 115)),
          margin: const EdgeInsets.symmetric(horizontal: 5),
        ),
        const Positioned(
          left: 10,
          bottom: 0,
          top: 10,
          child: Image(
            image: AssetImage(AImages.slide1),
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          right: 20,
          top: 40,
          bottom: 10,
          child: SizedBox(
            width: 190,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ATexts.slideHead1,
                  style:
                      ATextTheme.smallSubHeading.copyWith(color: AColors.white),
                ),
                Text(
                  ATexts.slideSubhead1,
                  style: ATextTheme.smallBody.copyWith(color: AColors.white),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 35,
          right: 25,
          child: SizedBox(
            height: 30,
            width: 125,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AColors.secondary,
                foregroundColor: AColors.white,
              ),
              child: const Text('Get Started'),
            ),
          ),
        ),
      ],
    );
  }
}

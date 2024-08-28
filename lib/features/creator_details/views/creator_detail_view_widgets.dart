import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CreatorPic extends StatelessWidget {
  const CreatorPic({
    super.key,
    required this.img,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Container(
          alignment: Alignment.center,
          height: 130,
          width: 130,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(65), color: AColors.primary),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(62),
            child: Image(
              image: NetworkImage(img),
              height: 125,
              width: 125,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class CreatorStats extends StatelessWidget {
  const CreatorStats({
    super.key,
    required this.coursesCreated,
    required this.rating,
  });

  final int coursesCreated;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: AColors.secondary,
                    borderRadius: BorderRadius.circular(17)),
                child: const Icon(
                  Icons.book,
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '${coursesCreated.toString()} Courses',
                  style: ATextTheme.bigBody,
                ),
              )
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          Column(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: AColors.secondary,
                    borderRadius: BorderRadius.circular(17)),
                child: const Icon(
                  Icons.star,
                  size: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  '${rating.toString()} Rating',
                  style: ATextTheme.bigBody,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//TODO make these clickable
class Socials extends StatelessWidget {
  const Socials({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset(
        AImages.facebookIcon,
        height: 50,
        width: 50,
      ),
      const SizedBox(
        width: 10,
      ),
      Image.asset(
        AImages.instaIcon,
        height: 60,
        width: 60,
      ),
      const SizedBox(
        width: 10,
      ),
      Image.asset(
        AImages.xIcon,
        height: 40,
        width: 40,
      ),
    ]);
  }
}

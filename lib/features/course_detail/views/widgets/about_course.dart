import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/authentication/views/generics/text_button.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class AboutCourse extends StatelessWidget {
  const AboutCourse({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(course.description),
          ),
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              const ClipOval(
                child: Image(
                  image: AssetImage('assets/images/home/instructor3.png'),
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    course.creatorId,
                    style: ATextTheme.smallSubHeading
                        .copyWith(color: AColors.textPrimary),
                  ),
                  Text(
                    //TODO Fix this
                    'Programmin',
                    // course.creator.specialty,
                    style: ATextTheme.bigBody,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: ElevatedTextButton(
            buttonText: 'Buy Now',
            onPressed: () {},
          ),
        )
      ],
    );
  }
}

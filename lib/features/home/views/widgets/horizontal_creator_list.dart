import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/routes.dart';
import 'package:prideofknowledge/data/models/creator.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class HorizontalCreatorsList extends StatelessWidget {
  final List<Creator> creators;

  const HorizontalCreatorsList({
    super.key,
    required this.creators,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: creators.length >= 6 ? 6 : creators.length,
      itemBuilder: (context, index) {
        final creator = creators[index];
        return SizedBox(
          width: 80,
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, creatorDetailRoute,
                      arguments: creator);
                },
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  alignment: Alignment.center,
                  height: 74,
                  width: 74,
                  decoration: BoxDecoration(
                      color: AColors.primary,
                      borderRadius: BorderRadius.circular(37)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image(
                      image: NetworkImage(creator.image),
                      fit: BoxFit.cover,
                      height: 70,
                      width: 70,
                    ),
                  ),
                ),
              ),
              IntrinsicWidth(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AColors.primary),
                  child: Text(
                    '${AHelperFunctions.getFirstWord(creator.name)}   ',
                    textAlign: TextAlign.center,
                    style: ATextTheme.bigBody.copyWith(color: AColors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

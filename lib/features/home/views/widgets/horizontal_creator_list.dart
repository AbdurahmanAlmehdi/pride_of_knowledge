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
                      arguments: {'creators': creator});
                },
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  alignment: Alignment.center,
                  height: 72,
                  width: 72,
                  decoration: const BoxDecoration(
                    color: AColors.textWhite,
                    shape: BoxShape.circle,
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 65,
                    width: 65,
                    decoration: const BoxDecoration(
                      color: AColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image(
                        image: NetworkImage(creator.image),
                        fit: BoxFit.contain,
                      ),
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

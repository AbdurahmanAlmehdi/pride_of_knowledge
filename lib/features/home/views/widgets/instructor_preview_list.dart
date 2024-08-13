import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';

import 'package:prideofknowledge/data/dummy/creator_dummy.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class InstructorsPreviewList extends StatelessWidget {
  const InstructorsPreviewList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 6,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 80,
          child: Column(
            children: [
              Container(
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
                      image: AssetImage(dummyCreators[index].image),
                      fit: BoxFit.contain,
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
                    '${AHelperFunctions.getFirstWord(dummyCreators[index].name)}   ',
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

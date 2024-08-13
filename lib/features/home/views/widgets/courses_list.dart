import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/data/dummy/categories_dummy.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: 5,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
          child: Container(
            width: 154,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.transparent),
            child: ListTile(
              horizontalTitleGap: 5,
              leading: Icon(
                categories[index].icon,
                color: AColors.textPrimary,
              ),
              title: Text(
                categories[index].category,
                style: ATextTheme.smallSubHeading
                    .copyWith(color: AColors.textPrimary),
              ),
            ),
          ),
        );
      },
    );
  }
}

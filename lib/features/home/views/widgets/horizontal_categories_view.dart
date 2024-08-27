import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/string_to_icon.dart';
import 'package:prideofknowledge/data/models/category.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class HorizontalCategoriesList extends StatelessWidget {
  final List<Category> categories;

  const HorizontalCategoriesList({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final category = categories[index];
        return InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(30),
          child: IntrinsicWidth(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.transparent),
              child: ListTile(
                horizontalTitleGap: 5,
                leading: Icon(StringToIcon.toIcon(category.icon)),
                title: Text(
                  category.name,
                  maxLines: 1,
                  style: ATextTheme.smallSubHeading
                      .copyWith(color: AColors.textPrimary),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

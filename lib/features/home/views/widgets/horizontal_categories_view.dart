import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/string_to_icon.dart';
import 'package:prideofknowledge/data/models/category.dart';

import 'package:prideofknowledge/features/home/services/providers/all_categories_provider.dart';
import 'package:prideofknowledge/utilities/dialogs/show_error_dialog.dart';
import 'package:prideofknowledge/utilities/helper/loading/loading.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class HorizontalCategoriesList extends ConsumerWidget {
  final List<Category> categories;

  const HorizontalCategoriesList({
    super.key,
    required this.categories,
  });

//TODO Use data provider
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(allCategoriesProvider);
    return categories.when(
      data: (data) {
        LoadingScreen().hide;
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: data.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = data[index];
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
                  leading: Icon(StringToIcon.toIcon(category.icon)),
                  title: Text(
                    category.name,
                    style: ATextTheme.smallSubHeading
                        .copyWith(color: AColors.textPrimary),
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (error, stackTrace) {
        LoadingScreen().hide;
        showErrorDialog(context, error.toString());
        return Container();
      },
      loading: () {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          LoadingScreen().show(context: context, text: 'Loading...');
        });
        return Container();
      },
    );
  }
}

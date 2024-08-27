import 'package:flutter/material.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/course_list/views/widgets/course_tile.dart';
import 'package:prideofknowledge/features/course_list/views/widgets/search_field.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CoursesListView extends StatelessWidget {
  const CoursesListView({
    super.key,
    this.title,
    this.showAppBar = true,
    this.showSearch = false,
    required this.courses,
  });

  final String? title;
  final bool showAppBar;
  final bool showSearch;
  final List<Course>? courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(
                title ?? '',
                style: ATextTheme.appBarTitle,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_alt),
                )
              ],
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            showSearch ? const SearchField() : const SizedBox(),
            courses == null
                ? const Center(
                    child: Text('Error'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: courses!.length,
                    itemBuilder: (context, index) {
                      final course = courses![index];
                      return CourseTile(course: course);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}

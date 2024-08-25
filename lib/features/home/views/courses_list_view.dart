import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/home/views/widgets/course_tile.dart';
import 'package:prideofknowledge/features/home/views/widgets/search_field.dart';

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
  final Iterable<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: Text(title ?? ''),
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
            Consumer(
              builder: (context, ref, child) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final course = courses.elementAt(index);
                    return CourseTile(course: course);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/data/models/creator.dart';
import 'package:prideofknowledge/features/course_list/views/widgets/course_tile.dart';
import 'package:prideofknowledge/features/creator_details/controllers/creator_detail_controller.dart';
import 'package:prideofknowledge/features/creator_details/views/creator_detail_view_widgets.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CreatorDetailView extends StatelessWidget {
  final Creator creator;

  const CreatorDetailView({
    super.key,
    required this.creator,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AColors.white,
        title: Text(
          creator.name,
          style: ATextTheme.appBarTitle,
        ),
      ),
      body: Column(
        children: [
          CreatorPic(img: creator.image),
          Text('${creator.specialty} Instructor',
              style: ATextTheme.bigSubHeading.copyWith(
                color: AColors.textWhite,
              )),
          const Divider(
            indent: 100,
            endIndent: 100,
          ),
          CreatorStats(
            coursesCreated: creator.coursesCreated,
            rating: creator.rating,
          ),
          const Socials(),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 8.0),
            child: Row(
              children: [
                Text(
                  'Courses',
                  style: ATextTheme.smallHeading,
                ),
              ],
            ),
          ),
          const Divider(
            indent: 15,
            endIndent: 15,
            thickness: 1.5,
            color: AColors.greyedOutBackround,
          ),
          CreatorCourseList(creator: creator)
        ],
      ),
    );
  }
}

class CreatorCourseList extends ConsumerWidget {
  const CreatorCourseList({
    super.key,
    required this.creator,
  });

  final Creator creator;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final courses =
        ref.watch(creatorCoursesControllerProvider(creator.creatorId));
    return courses.when(
      data: (courses) {
        if (courses.isNotEmpty) {
          return ListView.builder(
            itemCount: courses.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final course = courses[index];
              return CourseTile(course: course);
            },
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AImages.noCourses,
                  height: 200,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'This Creator has no courses yet',
                    style: ATextTheme.smallSubHeading,
                  ),
                )
              ],
            ),
          );
        }
      },
      error: (error, stackTrace) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            children: [
              Image.asset(
                AImages.error,
                height: 200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'An Unexpected Error Occured',
                  style: ATextTheme.smallSubHeading,
                ),
              )
            ],
          ),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

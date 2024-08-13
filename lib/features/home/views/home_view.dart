import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/navigation_consts.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/data/cloud/firebase_cloud_storage.dart';
import 'package:prideofknowledge/data/dummy/courses_dummy.dart';
import 'package:prideofknowledge/features/home/services/providers/all_courses_provider.dart';
import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';
import 'package:prideofknowledge/features/home/views/widgets/carousel_slide.dart';
import 'package:prideofknowledge/features/home/views/widgets/course_preview_list.dart';
import 'package:prideofknowledge/features/home/views/widgets/courses_list.dart';
import 'package:prideofknowledge/features/home/views/widgets/featured_courses.dart';
import 'package:prideofknowledge/features/home/views/widgets/instructor_preview_list.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

//TODO Make sure if creators/courses are less than a number make them only show the number of courses/creators in the listviewBuilder
class HomeView extends ConsumerWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = AHelperFunctions.screenWidth(context);
    final courses = ref.watch(allCoursesProvider);

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 220,
                child: PageView(
                  children: const [
                    CarouselSlide(),
                    CarouselSlide(),
                    CarouselSlide(),
                  ],
                ),
              ),
              const SizedBox(
                height: ASizes.spaceBtwItems,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: ATextTheme.bigSubHeading,
                    ),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(navigationProvider.notifier)
                            .setNavScreen(ANavigationIndex.categoriesViewIndex);
                      },
                      child: Text(
                        'See All',
                        style: ATextTheme.mediumSubHeading,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 55,
                child: CategoriesList(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trending Courses',
                      style: ATextTheme.bigSubHeading,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: ATextTheme.mediumSubHeading,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
                child: courses.when(
                  data: (courses) {
                    if (courses.isEmpty) {
                      return const Text(
                        'No Couses Availible',
                      );
                    } else {
                      return CoursePreviewList(
                        courses: courses,
                        screenWidth: screenWidth,
                      );
                    }
                  },
                  error: (error, stackTrace) {
                    return const Text(
                      'No Couses Availible',
                    );
                  },
                  loading: () {
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Rated Instructors',
                      style: ATextTheme.bigSubHeading,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: ATextTheme.mediumSubHeading,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
                child: InstructorsPreviewList(),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Top Rated Courses',
                      style: ATextTheme.bigSubHeading,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'See All',
                        style: ATextTheme.mediumSubHeading,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: courses.when(
            data: (courses) {
              if (courses.isEmpty) {
                return const Text(
                  'No Couses Availible',
                );
              } else {
                return FeaturedCourses(
                  courses: courses,
                );
              }
            },
            error: (error, stackTrace) {
              return const Text(
                'No Couses Availible',
              );
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}

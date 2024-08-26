import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/navigation_consts.dart';
import 'package:prideofknowledge/constants/routes.dart';
import 'package:prideofknowledge/constants/sizes.dart';
import 'package:prideofknowledge/features/home/services/controllers/home_controller.dart';
import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';
import 'package:prideofknowledge/features/home/views/widgets/carousel_slide.dart';
import 'package:prideofknowledge/features/home/views/widgets/horizontal_courses_list.dart';
import 'package:prideofknowledge/features/home/views/widgets/horizontal_categories_view.dart';
import 'package:prideofknowledge/features/home/views/widgets/title_see_all_row.dart';
import 'package:prideofknowledge/features/home/views/widgets/vertical_courses_list.dart';
import 'package:prideofknowledge/features/home/views/widgets/horizontal_creator_list.dart';
import 'package:prideofknowledge/utilities/dialogs/show_error_dialog.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';

class HomeView extends ConsumerWidget {
  final AsyncValue creators;
  final AsyncValue categories;

  const HomeView({
    super.key,
    required this.creators,
    required this.categories,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = AHelperFunctions.screenWidth(context);
    final featuredCourses = ref.watch(featuredCoursesControllerProvider);
    final topRatedCourses = ref.watch(topRatedCoursesControllerProvider);

    return SingleChildScrollView(
        child: Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 220,
              child: PageView(
                children: const [
                  // TODO Show Different Images
                  CarouselSlide(),
                  CarouselSlide(),
                  CarouselSlide(),
                ],
              ),
            ),
            const SizedBox(
              height: ASizes.spaceBtwItems,
            ),
            categories.when(
              data: (categories) {
                return Column(
                  children: [
                    TitleSeeAllRow(
                      title: 'Categories',
                      onPressed: () => ref
                          .read(navigationProvider.notifier)
                          .setNavScreen(ANavigationIndex.categoriesViewIndex),
                    ),
                    SizedBox(
                      height: 55,
                      child: HorizontalCategoriesList(
                        categories: categories,
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) {
                showErrorDialog(context, 'Error Retrieving Categories');
                return Container();
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            featuredCourses.when(
              data: (featuredCourses) {
                if (featuredCourses.isEmpty) {
                  return const Center(
                    child: Text(
                      'No Courses Availible',
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      TitleSeeAllRow(
                        title: 'Trending Courses',
                        onPressed: () {
                          Navigator.of(context).pushNamed(coursesListRoute,
                              arguments: featuredCourses);
                        },
                      ),
                      SizedBox(
                        height: 200,
                        child: HorizontalCourseView(
                          courses: featuredCourses,
                          screenWidth: screenWidth,
                        ),
                      ),
                    ],
                  );
                }
              },
              error: (error, stackTrace) {
                showErrorDialog(context, 'Error Retrieving Courses');
                return Container();
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            creators.when(
              data: (creators) {
                return Column(
                  children: [
                    TitleSeeAllRow(
                      title: 'Top Rated Instructors',
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 100,
                      child: HorizontalCreatorsList(
                        creators: creators,
                      ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) {
                showErrorDialog(context, 'No Creators Available');
                return Container();
              },
              loading: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
        topRatedCourses.when(
          data: (topRatedCourses) {
            if (topRatedCourses.isEmpty) {
              return const Text(
                'No Courses Availible',
              );
            } else {
              return Column(children: [
                TitleSeeAllRow(
                  title: 'Top Rated Courses',
                  onPressed: () {
                    Navigator.of(context).pushNamed(coursesListRoute,
                        arguments: topRatedCourses);
                  },
                ),
                VerticalCoursesList(
                  courses: topRatedCourses,
                ),
              ]);
            }
          },
          error: (error, stackTrace) {
            return const Text(
              'No Courses Availible',
            );
          },
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ],
    ));
  }
}

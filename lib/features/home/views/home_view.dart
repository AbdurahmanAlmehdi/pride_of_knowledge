import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/argumets.dart';
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
  final AsyncValue categories;

  const HomeView({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = AHelperFunctions.screenWidth(context);
    final featuredCourses = ref.watch(featuredCoursesControllerProvider);
    final topRatedCourses = ref.watch(topRatedCoursesControllerProvider);
    final creators = ref.watch(topRatedCreatorsControllerProvider);

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
                      child: categories.isEmpty
                          ? const Center(
                              child: Text('No Categories Available'),
                            )
                          : HorizontalCategoriesList(
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
                return const SizedBox(
                  height: 55,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
            featuredCourses.when(
              data: (featuredCourses) {
                return Column(
                  children: [
                    TitleSeeAllRow(
                      title: 'Trending Courses',
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(coursesListRoute, arguments: {
                          Arguments.courses: featuredCourses,
                          Arguments.title: 'Trending Courses',
                        });
                      },
                    ),
                    SizedBox(
                      height: 200,
                      child: featuredCourses.isEmpty
                          ? const Center(
                              child: Text('No Trending Courses Available'),
                            )
                          : HorizontalCourseView(
                              courses: featuredCourses,
                              screenWidth: screenWidth,
                            ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) {
                showErrorDialog(context, 'Error Retrieving Courses');
                return Container();
              },
              loading: () {
                return const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
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
                      child: creators.isEmpty
                          ? const Center(
                              child: Text('No Creators Available'),
                            )
                          : HorizontalCreatorsList(
                              creators: creators,
                            ),
                    ),
                  ],
                );
              },
              error: (error, stackTrace) {
                showErrorDialog(context, 'Error Retreiving Creators');
                return Container();
              },
              loading: () {
                return const SizedBox(
                  height: 100,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
        topRatedCourses.when(
          data: (topRatedCourses) {
            return Column(children: [
              TitleSeeAllRow(
                title: 'Top Rated Courses',
                onPressed: () {
                  Navigator.of(context).pushNamed(coursesListRoute, arguments: {
                    'courses': topRatedCourses,
                    'title': 'Top Rated Courses',
                  });
                },
              ),
              topRatedCourses.isEmpty
                  ? const Center(
                      child: Text('No Courses Availible'),
                    )
                  : VerticalCoursesList(
                      courses: topRatedCourses,
                    ),
            ]);
          },
          error: (error, stackTrace) {
            return const Text(
              'No Courses Availible',
            );
          },
          loading: () {
            return const SizedBox(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ],
    ));
  }
}

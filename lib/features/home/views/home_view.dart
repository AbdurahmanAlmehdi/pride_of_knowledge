import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/navigation_consts.dart';
import 'package:prideofknowledge/constants/sizes.dart';

import 'package:prideofknowledge/data/models/category.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/data/models/creator.dart';

import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';
import 'package:prideofknowledge/features/home/views/widgets/carousel_slide.dart';
import 'package:prideofknowledge/features/home/views/widgets/horizontal_courses_list.dart';
import 'package:prideofknowledge/features/home/views/widgets/horizontal_categories_view.dart';
import 'package:prideofknowledge/features/home/views/widgets/vertical_courses_list.dart';
import 'package:prideofknowledge/features/home/views/widgets/horizontal_creator_list.dart';
import 'package:prideofknowledge/utilities/dialogs/show_error_dialog.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/helper/loading/loading.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

//TODO Make sure if creators/courses are less than a number make them only show the number of courses/creators in the listviewBuilder
//TODO Make Custom Widget to Show See All Row
//TODO Deal with the .when
class HomeView extends StatelessWidget {
  final List<Creator> creators;
  final List<Category> categories;
  final AsyncValue<Iterable<Course>> courses;

  const HomeView({
    super.key,
    required this.creators,
    required this.categories,
    required this.courses,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = AHelperFunctions.screenWidth(context);

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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories',
                      style: ATextTheme.bigSubHeading,
                    ),
                    Consumer(
                      builder: (context, ref, child) {
                        return TextButton(
                          onPressed: () {
                            ref.read(navigationProvider.notifier).setNavScreen(
                                ANavigationIndex.categoriesViewIndex);
                          },
                          child: Text(
                            'See All',
                            style: ATextTheme.mediumSubHeading,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 55,
                child: HorizontalCategoriesList(
                  categories: categories,
                ),
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
                    LoadingScreen().hide;
                    if (courses.isEmpty) {
                      return const Text(
                        'No Courses Availible',
                      );
                    } else {
                      return HorizontalCourseView(
                        courses: courses,
                        screenWidth: screenWidth,
                      );
                    }
                  },
                  error: (error, stackTrace) {
                    LoadingScreen().hide;
                    showErrorDialog(context, 'Error Retrieving Courses');
                    return Container();
                  },
                  loading: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      LoadingScreen()
                          .show(context: context, text: 'Loading...');
                    });
                    return Container();
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
              SizedBox(
                height: 100,
                //TODO Update this with new data provider
                child: HorizontalCreatorsList(
                  creators: creators,
                ),
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
        courses.when(
          //TODO Update this to use Loading and error screen
          data: (courses) {
            if (courses.isEmpty) {
              return const SliverToBoxAdapter(
                child: Text(
                  'No Courses Availible',
                ),
              );
            } else {
              return VerticalCoursesList(
                courses: courses,
              );
            }
          },
          error: (error, stackTrace) {
            return const SliverToBoxAdapter(
              child: Text(
                'No Courses Availible',
              ),
            );
          },
          loading: () {
            return const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()));
          },
        ),
      ],
    );
  }
}

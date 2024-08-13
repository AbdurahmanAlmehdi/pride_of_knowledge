import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/constants/navigation_consts.dart';
import 'package:prideofknowledge/features/content/course_detail_view.dart';
import 'package:prideofknowledge/features/home/services/providers/current_course_provider.dart';
import 'package:prideofknowledge/features/home/views/categories_view.dart';
import 'package:prideofknowledge/features/home/views/courses_view.dart';
import 'package:prideofknowledge/features/home/views/favorites_view.dart';
import 'package:prideofknowledge/features/home/views/home_view.dart';
import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';
import 'package:prideofknowledge/features/home/views/profile_view.dart';
import 'package:prideofknowledge/features/home/views/widgets/bottom_nav_bar.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class TabsView extends ConsumerWidget {
  const TabsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final course = ref.watch(currentCourseProvider);
    final navIndex = ref.watch(navigationProvider);
    final navNotifier = ref.read(navigationProvider.notifier);

    Widget activeScreen = const HomeView();
    String? activeScreenTitle = 'Welcome Bob';
    Widget? leading;
    Widget? bottomNavigationBar =
        ABottomNavigationBar(index: navNotifier.navState);

    bool showAppBar = true;
    List<Widget>? actions = [
      IconButton(
        iconSize: 25,
        onPressed: () {},
        icon: const Icon(Icons.shopping_cart_outlined),
      ),
      IconButton(
        iconSize: 20,
        onPressed: () {},
        icon: const Icon(Icons.account_balance_wallet_outlined),
      ),
      InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: () {
          ref
              .read(navigationProvider.notifier)
              .setPageScreen(ANavigationIndex.profileViewIndex);
        },
        child: const CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage(AImages.profileImage),
          foregroundColor: AColors.black,
        ),
      ),
    ];

    if (navIndex != ANavigationIndex.homeViewIndex) {
      switch (navIndex) {
        case ANavigationIndex.courseViewIndex:
          activeScreen = const CoursesView();
          activeScreenTitle = 'My Courses';
          bottomNavigationBar = ABottomNavigationBar(index: navIndex);
          break;
        case ANavigationIndex.categoriesViewIndex:
          activeScreen = const CategoriesView();
          activeScreenTitle = 'Categories';
          bottomNavigationBar = ABottomNavigationBar(index: navIndex);
          break;
        case ANavigationIndex.favoritesViewIndex:
          activeScreen = const FavoritesView();
          activeScreenTitle = 'Favorites';
          bottomNavigationBar = ABottomNavigationBar(index: navIndex);
          break;
        case ANavigationIndex.profileViewIndex:
          activeScreen = const ProfileView();
          activeScreenTitle = 'Profile Settings';
          bottomNavigationBar = null;
          actions = null;
          leading = IconButton(
            onPressed: () {
              ref
                  .read(navigationProvider.notifier)
                  .setNavScreen(navNotifier.navState);
            },
            icon: const Icon(Icons.keyboard_arrow_left),
          );
        case ANavigationIndex.courseDetailsViewIndex:
          activeScreen = CourseDetailView(course: course);
          activeScreenTitle = null;
          bottomNavigationBar = null;
          showAppBar = false;
        default:
          const CircularProgressIndicator();
      }
    }

    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              backgroundColor: AColors.white,
              title: activeScreenTitle != null
                  ? Text(
                      activeScreenTitle,
                      style: ATextTheme.mediumHeading,
                    )
                  : null,
              actions: actions,
              leading: leading,
            )
          : null,
      body: activeScreen,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

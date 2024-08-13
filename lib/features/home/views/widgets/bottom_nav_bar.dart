import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/features/home/services/providers/nav_provider.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class ABottomNavigationBar extends ConsumerWidget {
  const ABottomNavigationBar({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      onTap: (index) {
        ref.read(navigationProvider.notifier).setNavScreen(index);
      },
      currentIndex: index,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedItemColor: AColors.secondary,
      unselectedItemColor: AColors.primary,
      unselectedLabelStyle: ATextTheme.smallBody,
      selectedLabelStyle: ATextTheme.smallBody.copyWith(
        color: AColors.secondary,
        fontSize: 12,
      ),
      backgroundColor: AColors.white,
      iconSize: 25,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.book_outlined,
          ),
          label: 'My Courses',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
            ),
            label: 'Categories'),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: 'Favorites'),
      ],
    );
  }
}

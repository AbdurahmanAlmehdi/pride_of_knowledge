import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/features/favorites/controllers/favorites_controller.dart';
import 'package:prideofknowledge/features/favorites/views/widgets.dart';

class FavoritesView extends ConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteCourses = ref.watch(favoritesControllerProvider);
    if (favoriteCourses.isEmpty) {
      return const NoFavorites();
    } else {
      return FavoriteCourses(favoriteCourses: favoriteCourses);
    }
  }
}

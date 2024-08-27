import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/favorites/providers/repository_provider.dart';
import 'package:prideofknowledge/features/favorites/repositories/favorites_repository.dart';

class FavoritesController extends StateNotifier<List<Course>> {
  final FavoritesRepository _repository;
  FavoritesController(this._repository) : super(_repository.getFavorites());

  void toggleFavorite(Course course) {
    if (!_repository.isFavorite(course)) {
      _repository.addFavorite(course);
      state = [...state, course];
    } else {
      _repository.removeFavorite(course);
      state = state.where((c) => c != course).toList();
    }
  }

  bool isFavorite(Course course) {
    return _repository.isFavorite(course);
  }
}

final favoritesControllerProvider =
    StateNotifierProvider<FavoritesController, List<Course>>((ref) {
  return FavoritesController(ref.read(favoritesRepositoryProvider));
});

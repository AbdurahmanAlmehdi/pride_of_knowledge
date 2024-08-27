import 'package:get_storage/get_storage.dart';
import 'package:prideofknowledge/data/models/course.dart';

class FavoritesRepository {
  final GetStorage _storage = GetStorage();
  final favoritesKey = 'favorites';

  List<Course> getFavorites() {
    final favorites = _storage.read<List>(favoritesKey) ?? [];
    return favorites
        .map(
          (json) => Course.fromJson(json),
        )
        .toList();
  }

  void addFavorite(Course course) {
    final favorites = getFavorites();
    if (!favorites.any(
      (favorite) => favorite.courseId == course.courseId,
    )) {
      favorites.add(course);
      _storage.write(
          favoritesKey,
          favorites
              .map(
                (e) => e.toJson(),
              )
              .toList());
    }
  }

  void removeFavorite(Course course) {
    final favorites = getFavorites();
    if (favorites.any(
      (favorite) => favorite.courseId == course.courseId,
    )) {
      favorites.removeWhere(
        (element) => element.courseId == course.courseId,
      );
      _storage.write(
          favoritesKey,
          favorites
              .map(
                (e) => e.toJson(),
              )
              .toList());
    }
  }

  bool isFavorite(Course course) {
    final favorites = getFavorites();
    return (favorites.any(
      (element) => element.courseId == course.courseId,
    ));
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/features/favorites/repositories/favorites_repository.dart';

final favoritesRepositoryProvider = Provider<FavoritesRepository>((ref) {
  return FavoritesRepository();
});

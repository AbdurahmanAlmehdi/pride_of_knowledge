import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:prideofknowledge/data/models/category.dart';
import 'package:prideofknowledge/data/models/creator.dart';
import 'package:prideofknowledge/features/home/services/providers/all_categories_provider.dart';
import 'package:prideofknowledge/features/home/services/providers/all_creators_provider.dart';

final dataNotifierProvider = StateNotifierProvider<DataNotifier, Data>((ref) {
  final creators = ref.watch(allCreatorsProvider);
  final categories = ref.watch(allCategoriesProvider);
  return DataNotifier(creators, categories);
});

class DataNotifier extends StateNotifier<Data> {
  DataNotifier(
      AsyncValue<List<Creator>> creators, AsyncValue<List<Category>> categories)
      : super(Data(categories: [], creators: [])) {
    creators.whenData((creators) {
      state = state.copyWith(creators: creators);
    });

    categories.whenData((categories) {
      state = state.copyWith(categories: categories);
    });
  }
}

class Data {
  final List<Creator> creators;
  final List<Category> categories;

  Data({required this.creators, required this.categories});

  Data copyWith({List<Creator>? creators, List<Category>? categories}) {
    return Data(
      creators: creators ?? this.creators,
      categories: categories ?? this.categories,
    );
  }
}

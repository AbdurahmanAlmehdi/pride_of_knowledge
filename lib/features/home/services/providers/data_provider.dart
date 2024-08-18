import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/data/cloud/cloud_constants.dart';
import 'package:prideofknowledge/features/home/services/providers/all_categories_provider.dart';
import 'package:prideofknowledge/features/home/services/providers/all_creators_provider.dart';

final dataProvider = Provider<Map<String, dynamic>>((ref) {
  final data = {
    creatorsCollection: [],
    categoriesCollection: [],
  };
  final creators = ref.watch(allCreatorsProvider);
  final categories = ref.watch(allCategoriesProvider);

  creators.whenData(
    (value) {
      data[creatorsCollection] = value;
    },
  );
  categories.whenData(
    (value) {
      data[categoriesCollection] = value;
    },
  );
  return data;
});

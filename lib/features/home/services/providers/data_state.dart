import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/features/home/services/providers/all_categories_provider.dart';
import 'package:prideofknowledge/features/home/services/providers/all_creators_provider.dart';

class DataState {
  final bool isLoading;
  final bool isFailed;

  DataState({required this.isLoading, required this.isFailed});

  DataState copyWithIsLoading(bool isLoading) =>
      DataState(isLoading: isLoading, isFailed: isFailed);
  DataState copyWithIsFailed(bool isFailed) =>
      DataState(isLoading: isLoading, isFailed: isFailed);

  @override
  bool operator ==(covariant DataState other) =>
      identical(this, other) ||
      (isLoading == other.isLoading && isFailed == other.isFailed);

  @override
  int get hashCode => Object.hash(isLoading, isFailed);
}

final dataStateProvider = Provider<DataState>((ref) {
  final dataState = DataState(isLoading: false, isFailed: false);
  final creators = ref.watch(allCreatorsProvider);
  final categories = ref.watch(allCategoriesProvider);

  if (creators.isLoading || categories.isLoading) {
    dataState.copyWithIsLoading(true);
  } else {
    dataState.copyWithIsLoading(false);
  }

  if (creators.error != null || categories.error != null) {
    dataState.copyWithIsFailed(true);
  } else {
    dataState.copyWithIsFailed(false);
  }
  return dataState;
});

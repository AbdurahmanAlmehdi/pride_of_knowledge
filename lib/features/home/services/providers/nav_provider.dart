import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationNotifier extends StateNotifier<int> {
  NavigationNotifier() : super(0);
  int _navState = 0;
  int _pageState = 0;

  int get navState => _navState;
  int get pageState => _pageState;

  void setNavScreen(int index) {
    _navState = index;
    state = _navState;
  }

  void setPageScreen(int index) {
    _pageState = index;
    state = _pageState;
  }

  void reset() {
    _pageState = 0;
    _navState = 0;
    state = _pageState;
  }
}

final navigationProvider =
    StateNotifierProvider<NavigationNotifier, int>((ref) {
  return NavigationNotifier();
});

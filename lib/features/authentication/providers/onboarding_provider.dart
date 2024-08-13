import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingNotifier extends StateNotifier<int> {
  OnboardingNotifier() : super(0);

  final pageController = PageController();

  // Update State when page is changed
  void updatePageIndicator(int index) => state = index;

  // Jump to page when dot clicked
  void dotNavigationClick(index) {
    state = index;
    pageController.jumpToPage(index);
  }

  // update the state and jump to next page when button is clicked
  void nextButtonNavigation() {
    final currentIndex = state;
    final newIndex = currentIndex + 1;
    pageController.jumpToPage(newIndex);
    state = newIndex;
  }

  // update the state and jump to last page
  void skipNavigation() {
    state = 2;
    pageController.jumpToPage(2);
  }
}

final onboardingProvider =
    StateNotifierProvider<OnboardingNotifier, int>((ref) {
  return OnboardingNotifier();
});

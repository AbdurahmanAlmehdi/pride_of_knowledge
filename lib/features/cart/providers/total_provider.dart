import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/conversion_rates.dart';
import 'package:prideofknowledge/data/models/course.dart';

class TotalNotifier extends StateNotifier<int> {
  TotalNotifier() : super(0);

  void getTotal(List<Course> courses) {
    final total = courses.fold(
      0,
      (sum, course) {
        if (course.currency == 'USD') {
          final price = course.price * AConversionRates.usdConversion;
          return sum + price;
        } else {
          return sum + course.price;
        }
      },
    );
    state = total;
  }
}

final totalNotifierProvider = StateNotifierProvider<TotalNotifier, int>((ref) {
  return TotalNotifier();
});

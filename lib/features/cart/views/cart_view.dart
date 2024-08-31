import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/image_strings.dart';
import 'package:prideofknowledge/features/cart/controllers/cart_controller.dart';
import 'package:prideofknowledge/features/cart/providers/total_provider.dart';

import 'package:prideofknowledge/features/course_list/views/widgets/course_tile.dart';
import 'package:prideofknowledge/features/purchases/views/widgets.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:prideofknowledge/utilities/widgets/global_widgets.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});

  final int balance = 100;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartItems = ref.watch(cartViewControllerProvider);
    final total = ref.watch(totalNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: ATextTheme.appBarTitle,
        ),
      ),
      body: cartItems.when(
        data: (data) {
          final courses = data;
          if (courses.isEmpty) {
            return const NoCourses(image: AImages.noCourses);
          } else {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(totalNotifierProvider.notifier).getTotal(courses);
            });
            return ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return CourseTile(
                      course: course,
                      isCartItem: true,
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Tile(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Your Balance:',
                                style: ATextTheme.bigSubHeading,
                              ),
                              Text(
                                '${balance.toString()} LYD',
                                style: ATextTheme.mediumSubHeading
                                    .copyWith(color: AColors.textWhite),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total:',
                                style: ATextTheme.bigSubHeading,
                              ),
                              Text(
                                '${total.toString()} LYD',
                                style: ATextTheme.mediumSubHeading
                                    .copyWith(color: AColors.textWhite),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        },
        error: (error, stackTrace) => const NoCourses(image: AImages.error),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

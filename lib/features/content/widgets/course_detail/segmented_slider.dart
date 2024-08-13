import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/features/home/services/providers/current_course_provider.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class SegmentedSlider extends ConsumerWidget {
  const SegmentedSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLessonsSelected = ref.watch(sliderProvider);
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: AColors.greyedOutBackround,
          borderRadius: BorderRadius.circular(100)),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                ref.read(sliderProvider.notifier).state = !isLessonsSelected;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isLessonsSelected
                      ? AColors.greyedOutBackround
                      : AColors.secondary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'About',
                    style: ATextTheme.smallSubHeading.copyWith(
                      color:
                          isLessonsSelected ? AColors.textWhite : AColors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {
                ref.read(sliderProvider.notifier).state = !isLessonsSelected;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isLessonsSelected
                      ? AColors.secondary
                      : AColors.greyedOutBackround,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    'Lessons',
                    style: ATextTheme.smallSubHeading.copyWith(
                      color:
                          isLessonsSelected ? AColors.white : AColors.textWhite,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

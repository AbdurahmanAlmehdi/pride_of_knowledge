import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/colors.dart';

import 'package:prideofknowledge/features/course_detail/services/providers/section_provider.dart';
import 'package:prideofknowledge/features/course_detail/services/providers/video_provider.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CourseSections extends ConsumerWidget {
  const CourseSections({
    super.key,
    required this.courseId,
  });

  final String courseId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections = ref.watch(sectionProvider(courseId));

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      children: [
        //TODO get video count
        Text(
          // '$courseSectionCount Sections • ${getVideoCount(sections)} Lectures',
          'Sections',
          style: ATextTheme.smallSubHeading.copyWith(color: AColors.black),
          textAlign: TextAlign.start,
        ),
        sections.when(
          error: (error, stackTrace) {
            return const Text('Error Retreiving Content1');
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (sectionData) {
            return ListView.builder(
              padding: const EdgeInsets.only(top: 12, bottom: 8),
              itemCount: sectionData.length,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, sectionIndex) {
                final section = sectionData[sectionIndex];
                final videos = ref.watch(videoProvider(section.sectionId));
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Section ${section.sectionOrder} - ${section.title}',
                          style: ATextTheme.smallSubHeading,
                        ),
                        Text(
                          // TODO get course mins
                          AHelperFunctions.toHours(60),
                          style: ATextTheme.smallSubHeading,
                        )
                      ],
                    ),
                    videos.when(
                      data: (videoData) {
                        return ListView.separated(
                          separatorBuilder: (context, videoIndex) {
                            return Container(
                              height: 15,
                              color: Colors.transparent,
                            );
                          },
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: videoData.length,
                          itemBuilder: (context, videoIndex) {
                            final video = videoData[videoIndex];
                            return Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: AColors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: const Offset(0, 2),
                                    color: AColors.black.withOpacity(0.25),
                                  ),
                                  const BoxShadow(
                                    offset: Offset(-2, 0),
                                    color: AColors.white,
                                  ),
                                  const BoxShadow(
                                    offset: Offset(2, 0),
                                    color: AColors.white,
                                  )
                                ],
                              ),
                              child: Center(
                                child: ListTile(
                                  trailing: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      color: AColors.secondary,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.play_arrow),
                                    ),
                                  ),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: AColors.greyedOutBackround,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Center(
                                        child: Text(
                                      video.videoOrder.toString(),
                                      style: ATextTheme.mediumHeading,
                                    )),
                                  ),
                                  title: Text(video.title),
                                  subtitle: Text(video.videoLength.toString()),
                                ),
                              ),
                            );
                          },
                        );
                      },
                      error: (error, stackTrace) =>
                          const Text('Error Retreiving Content2'),
                      loading: () => const CircularProgressIndicator(),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }
}

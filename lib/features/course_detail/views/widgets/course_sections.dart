import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/constants/argumets.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/constants/routes.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/course_detail/services/controllers/section_controller.dart';
import 'package:prideofknowledge/features/course_detail/services/controllers/video_controller.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CourseSections extends ConsumerWidget {
  const CourseSections({
    super.key,
    required this.course,
  });

  final Course course;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sections =
        ref.watch(CourseSectionsControllerProvider(course.courseId));

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      children: [
        Text(
          '${course.numSections} Sections • ${course.numVideos} Lectures',
          style: ATextTheme.smallSubHeading.copyWith(color: AColors.black),
          textAlign: TextAlign.start,
        ),
        sections.when(
          error: (error, stackTrace) {
            return const Center(child: Text('Error Retreiving Sections'));
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
                final videos =
                    ref.watch(videosControllerProvider(section.sectionId));

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
                          AHelperFunctions.toHours(course.courseMins),
                          style: ATextTheme.smallSubHeading,
                        )
                      ],
                    ),
                    videos.when(
                      data: (videoData) {
                        return ListView.separated(
                          separatorBuilder: (context, _) {
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
                                      onPressed: () {
                                        Navigator.pushNamed(context, videoRoute,
                                            arguments: {
                                              Arguments.videoTitle: video.title,
                                              Arguments.url: video.videoUrl,
                                            });
                                      },
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
                      error: (error, stackTrace) => SizedBox(
                          height: 95,
                          child: Center(
                              child: Text(
                            'Error Retreiving Videos',
                            style: ATextTheme.smallSubHeading
                                .copyWith(color: AColors.textPrimary),
                          ))),
                      loading: () => const SizedBox(
                          height: 95,
                          child: Center(child: LinearProgressIndicator())),
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

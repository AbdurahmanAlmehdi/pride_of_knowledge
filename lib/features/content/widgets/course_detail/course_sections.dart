import 'package:flutter/material.dart';
import 'package:prideofknowledge/constants/colors.dart';
import 'package:prideofknowledge/data/dummy/sections_dummy.dart';
import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/data/models/section.dart';
import 'package:prideofknowledge/data/models/video.dart';
import 'package:prideofknowledge/utilities/helper/helper_functions.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';

class CourseSections extends StatelessWidget {
  const CourseSections({super.key, required this.course});

  final Course course;

  int getVideoCount(List<Video>? videos) {
    Video video;
    int numVideos = 0;
    if (videos != null) {
      for (video in videos) {
        numVideos += videos.length;
      }
    }
    return numVideos;
  }

  @override
  Widget build(BuildContext context) {
    final List<Section>? sections = dummySections['course1'];
    final courseSectionCount = (sections?.length) ?? 0;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      children: [
        //TODO get video count
        Text(
          // '$courseSectionCount Sections • ${getVideoCount(sections)} Lectures',
          'Sections',
          style: ATextTheme.smallSubHeading.copyWith(color: AColors.black),
          textAlign: TextAlign.start,
        ),
        ListView.builder(
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          itemCount: courseSectionCount,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Section ${index + 1} - ${sections![index].title}',
                      style: ATextTheme.smallSubHeading,
                    ),
                    Text(
                      // TODO get course mins
                      AHelperFunctions.toHours(60),
                      style: ATextTheme.smallSubHeading,
                    )
                  ],
                ),
                ListView.separated(
                  separatorBuilder: (context, videoIndex) {
                    return Container(
                      height: 12,
                      color: AColors.greyedOutBackround,
                    );
                  },
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 1,
                  //TODO FIX here
                  // itemCount: sections[index].videos.length,
                  itemBuilder: (context, videoIndex) {
                    return ListTile(
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
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(
                          ((index == 0 ? index : index + 1) + 1 + videoIndex)
                              .toString(),
                          style: ATextTheme.mediumHeading,
                        )),
                      ),
                      //TODO FIX
                      // title: Text(sections[index].videos[videoIndex].title),
                      title: const Text('Hello'),
                      subtitle: const Text('00:00 mins'),
                    );
                  },
                )
              ],
            );
          },
        ),
      ],
    );
  }
}

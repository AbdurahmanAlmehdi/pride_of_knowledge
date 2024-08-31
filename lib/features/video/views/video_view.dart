import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/features/video/controllers/video_controller.dart';
import 'package:prideofknowledge/utilities/theme/widget_themes/text_theme.dart';
import 'package:video_player/video_player.dart';

class VideoView extends ConsumerWidget {
  final String url;
  final String videoTitle;
  const VideoView({required this.url, required this.videoTitle, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(
        VideoPlayerProvider(dataSourceType: DataSourceType.network, url: url));
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Chewie(
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              videoTitle,
              style: ATextTheme.mediumHeading,
            ),
          ),
          const Divider(
            height: 50,
            indent: 30,
            endIndent: 30,
          ),
        ],
      ),
    );
  }
}

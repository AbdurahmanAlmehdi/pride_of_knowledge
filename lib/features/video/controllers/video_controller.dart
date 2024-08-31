// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_controller.g.dart';

@riverpod
ChewieController videoPlayer(VideoPlayerRef ref,
    {required DataSourceType dataSourceType, required String url}) {
  // ignore: no_leading_underscores_for_local_identifiers
  final VideoPlayerController _videoPlayerController;

  switch (dataSourceType) {
    case DataSourceType.asset:
      _videoPlayerController = VideoPlayerController.asset(url);
      break;
    case DataSourceType.network:
      _videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(url));
      break;
    case DataSourceType.file:
      _videoPlayerController = VideoPlayerController.file(File(url));
      break;
    case DataSourceType.contentUri:
      _videoPlayerController = VideoPlayerController.contentUri(Uri.parse(url));
      break;
  }

  final chewieController = ChewieController(
      videoPlayerController: _videoPlayerController, aspectRatio: 16 / 9);

  return chewieController;
}

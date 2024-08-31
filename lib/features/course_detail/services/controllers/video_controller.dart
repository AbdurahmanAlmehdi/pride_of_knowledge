import 'package:prideofknowledge/data/models/video.dart';
import 'package:prideofknowledge/features/course_detail/services/provider/repo_providers.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'video_controller.g.dart';

@riverpod
Future<List<Video>> videosController(
  VideosControllerRef ref,
  String sectionId,
) async {
  final repo = ref.read(videoRepositoryProvider);
  try {
    final videos = await repo.retreiveVideos(sectionId);
    return videos;
  } catch (e) {
    rethrow;
  }
}

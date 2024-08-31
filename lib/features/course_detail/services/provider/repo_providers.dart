import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prideofknowledge/features/course_detail/services/repositories/section_repository.dart';
import 'package:prideofknowledge/features/course_detail/services/repositories/video_repository.dart';
import 'package:prideofknowledge/utilities/providers/general_provider.dart';

final sectionRepositoryProvider = Provider<SectionRepository>((ref) {
  return SectionRepository(firebase: ref.read(firestoreProvider));
});
final videoRepositoryProvider = Provider<VideoRepository>((ref) {
  return VideoRepository(firebase: ref.read(firestoreProvider));
});

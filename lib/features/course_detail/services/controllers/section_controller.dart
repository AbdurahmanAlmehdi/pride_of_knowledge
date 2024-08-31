import 'package:prideofknowledge/data/models/section.dart';
import 'package:prideofknowledge/features/course_detail/services/provider/repo_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'section_controller.g.dart';

@riverpod
Future<List<Section>> courseSectionsController(
  CourseSectionsControllerRef ref,
  String courseId,
) async {
  final repo = ref.read(sectionRepositoryProvider);
  try {
    final sections = await repo.retreiveSections(courseId);
    return sections;
  } catch (e) {
    rethrow;
  }
}

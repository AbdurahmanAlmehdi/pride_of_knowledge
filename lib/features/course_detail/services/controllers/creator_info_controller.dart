import 'package:prideofknowledge/data/models/creator.dart';
import 'package:prideofknowledge/features/home/services/repositories/creator_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'creator_info_controller.g.dart';

@Riverpod(keepAlive: true)
Future<Creator> creatorInfoController(
    CreatorInfoControllerRef ref, String creatorId) async {
  final repo = ref.read(creatorRepositoryProvider);
  return await repo.getCreatorInfo(creatorId);
}

import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/authentication/providers/user_provider.dart';
import 'package:prideofknowledge/features/purchases/repositories/purchase_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'purchase_controller.g.dart';

@riverpod
Future<List<Course>> purchasedCoursesController(
    PurchasedCoursesControllerRef ref, List<String> courseIds) async {
  final repo = ref.read(purchaseRepositoryProvider);
  try {
    final courses = await repo.retrievePurchasedCourses(courseIds);
    return courses;
  } catch (e) {
    rethrow;
  }
}

@riverpod
Future<bool> updatePurchasedCoursesController(
  UpdatePurchasedCoursesControllerRef ref,
  String courseId,
) async {
  final currentUser = ref.watch(userProvider);
  final repo = ref.read(purchaseRepositoryProvider);

  try {
    final purcahsedCourses = repo.updatePurchasedCourse(
      currentUser.purchasedCourses ?? [],
      courseId,
      currentUser.uid,
    );
    return purcahsedCourses;
  } catch (e) {
    rethrow;
  }
}

@riverpod
Future<void> updateBalanceController(
  UpdateBalanceControllerRef ref,
  int change,
) async {
  final currentUser = ref.watch(userProvider);
  final repo = ref.read(purchaseRepositoryProvider);
  final balance = currentUser.balance;
  try {
    repo.updateBalance(
      newBalance: balance ?? 0 + change,
      userId: currentUser.uid,
    );
  } catch (e) {
    rethrow;
  }
}

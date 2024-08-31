import 'package:prideofknowledge/data/models/course.dart';
import 'package:prideofknowledge/features/authentication/providers/user_provider.dart';
import 'package:prideofknowledge/features/cart/repositories/cart_repository.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_controller.g.dart';

@riverpod
Future<List<Course>> cartViewController(CartViewControllerRef ref) async {
  final currentUser = ref.watch(userProvider);
  final repo = ref.read(cartRepositoryProvider);
  try {
    final cart = await repo.retrieveCartItems(currentUser.cartItems ?? []);
    return cart;
  } catch (e) {
    rethrow;
  }
}

@riverpod
Future<bool> updateCartController(
  UpdateCartControllerRef ref,
  String courseId,
) async {
  final currentUser = ref.watch(userProvider);
  final repo = ref.read(cartRepositoryProvider);

  try {
    final cart = await repo.updateCart(
        userId: currentUser.uid,
        cartItems: currentUser.cartItems ?? [],
        courseId: courseId);
    return cart;
  } catch (e) {
    rethrow;
  }
}

@riverpod
Future<bool> removeCartItemController(
  RemoveCartItemControllerRef ref,
  String courseId,
) async {
  final currentUser = ref.watch(userProvider);
  final repo = ref.read(cartRepositoryProvider);

  try {
    final cart = await repo.removeCartItem(
        userId: currentUser.uid,
        cartItems: currentUser.cartItems ?? [],
        courseId: courseId);
    return cart;
  } catch (e) {
    rethrow;
  }
}

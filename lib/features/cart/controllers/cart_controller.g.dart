// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartViewControllerHash() =>
    r'c12574e647f17311f8613af6eb6c156ca74535e7';

/// See also [cartViewController].
@ProviderFor(cartViewController)
final cartViewControllerProvider =
    AutoDisposeFutureProvider<List<Course>>.internal(
  cartViewController,
  name: r'cartViewControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartViewControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartViewControllerRef = AutoDisposeFutureProviderRef<List<Course>>;
String _$updateCartControllerHash() =>
    r'd2df490911152c5fa7d7e6dc2dbc90dcfb5513ec';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [updateCartController].
@ProviderFor(updateCartController)
const updateCartControllerProvider = UpdateCartControllerFamily();

/// See also [updateCartController].
class UpdateCartControllerFamily extends Family<AsyncValue<bool>> {
  /// See also [updateCartController].
  const UpdateCartControllerFamily();

  /// See also [updateCartController].
  UpdateCartControllerProvider call(
    String courseId,
  ) {
    return UpdateCartControllerProvider(
      courseId,
    );
  }

  @override
  UpdateCartControllerProvider getProviderOverride(
    covariant UpdateCartControllerProvider provider,
  ) {
    return call(
      provider.courseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'updateCartControllerProvider';
}

/// See also [updateCartController].
class UpdateCartControllerProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [updateCartController].
  UpdateCartControllerProvider(
    String courseId,
  ) : this._internal(
          (ref) => updateCartController(
            ref as UpdateCartControllerRef,
            courseId,
          ),
          from: updateCartControllerProvider,
          name: r'updateCartControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateCartControllerHash,
          dependencies: UpdateCartControllerFamily._dependencies,
          allTransitiveDependencies:
              UpdateCartControllerFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  UpdateCartControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
  }) : super.internal();

  final String courseId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(UpdateCartControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateCartControllerProvider._internal(
        (ref) => create(ref as UpdateCartControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _UpdateCartControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateCartControllerProvider && other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateCartControllerRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `courseId` of this provider.
  String get courseId;
}

class _UpdateCartControllerProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with UpdateCartControllerRef {
  _UpdateCartControllerProviderElement(super.provider);

  @override
  String get courseId => (origin as UpdateCartControllerProvider).courseId;
}

String _$removeCartItemControllerHash() =>
    r'32a46526d728e3b55e4169dcecdf7821641867a1';

/// See also [removeCartItemController].
@ProviderFor(removeCartItemController)
const removeCartItemControllerProvider = RemoveCartItemControllerFamily();

/// See also [removeCartItemController].
class RemoveCartItemControllerFamily extends Family<AsyncValue<bool>> {
  /// See also [removeCartItemController].
  const RemoveCartItemControllerFamily();

  /// See also [removeCartItemController].
  RemoveCartItemControllerProvider call(
    String courseId,
  ) {
    return RemoveCartItemControllerProvider(
      courseId,
    );
  }

  @override
  RemoveCartItemControllerProvider getProviderOverride(
    covariant RemoveCartItemControllerProvider provider,
  ) {
    return call(
      provider.courseId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'removeCartItemControllerProvider';
}

/// See also [removeCartItemController].
class RemoveCartItemControllerProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [removeCartItemController].
  RemoveCartItemControllerProvider(
    String courseId,
  ) : this._internal(
          (ref) => removeCartItemController(
            ref as RemoveCartItemControllerRef,
            courseId,
          ),
          from: removeCartItemControllerProvider,
          name: r'removeCartItemControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$removeCartItemControllerHash,
          dependencies: RemoveCartItemControllerFamily._dependencies,
          allTransitiveDependencies:
              RemoveCartItemControllerFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  RemoveCartItemControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseId,
  }) : super.internal();

  final String courseId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(RemoveCartItemControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: RemoveCartItemControllerProvider._internal(
        (ref) => create(ref as RemoveCartItemControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseId: courseId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _RemoveCartItemControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RemoveCartItemControllerProvider &&
        other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RemoveCartItemControllerRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `courseId` of this provider.
  String get courseId;
}

class _RemoveCartItemControllerProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with RemoveCartItemControllerRef {
  _RemoveCartItemControllerProviderElement(super.provider);

  @override
  String get courseId => (origin as RemoveCartItemControllerProvider).courseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

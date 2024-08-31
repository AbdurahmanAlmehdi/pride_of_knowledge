// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purchasedCoursesControllerHash() =>
    r'f9d9198c807a21a9593515db2c2087491adb56b0';

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

/// See also [purchasedCoursesController].
@ProviderFor(purchasedCoursesController)
const purchasedCoursesControllerProvider = PurchasedCoursesControllerFamily();

/// See also [purchasedCoursesController].
class PurchasedCoursesControllerFamily
    extends Family<AsyncValue<List<Course>>> {
  /// See also [purchasedCoursesController].
  const PurchasedCoursesControllerFamily();

  /// See also [purchasedCoursesController].
  PurchasedCoursesControllerProvider call(
    List<String> courseIds,
  ) {
    return PurchasedCoursesControllerProvider(
      courseIds,
    );
  }

  @override
  PurchasedCoursesControllerProvider getProviderOverride(
    covariant PurchasedCoursesControllerProvider provider,
  ) {
    return call(
      provider.courseIds,
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
  String? get name => r'purchasedCoursesControllerProvider';
}

/// See also [purchasedCoursesController].
class PurchasedCoursesControllerProvider
    extends AutoDisposeFutureProvider<List<Course>> {
  /// See also [purchasedCoursesController].
  PurchasedCoursesControllerProvider(
    List<String> courseIds,
  ) : this._internal(
          (ref) => purchasedCoursesController(
            ref as PurchasedCoursesControllerRef,
            courseIds,
          ),
          from: purchasedCoursesControllerProvider,
          name: r'purchasedCoursesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$purchasedCoursesControllerHash,
          dependencies: PurchasedCoursesControllerFamily._dependencies,
          allTransitiveDependencies:
              PurchasedCoursesControllerFamily._allTransitiveDependencies,
          courseIds: courseIds,
        );

  PurchasedCoursesControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.courseIds,
  }) : super.internal();

  final List<String> courseIds;

  @override
  Override overrideWith(
    FutureOr<List<Course>> Function(PurchasedCoursesControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PurchasedCoursesControllerProvider._internal(
        (ref) => create(ref as PurchasedCoursesControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        courseIds: courseIds,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Course>> createElement() {
    return _PurchasedCoursesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PurchasedCoursesControllerProvider &&
        other.courseIds == courseIds;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseIds.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PurchasedCoursesControllerRef
    on AutoDisposeFutureProviderRef<List<Course>> {
  /// The parameter `courseIds` of this provider.
  List<String> get courseIds;
}

class _PurchasedCoursesControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<Course>>
    with PurchasedCoursesControllerRef {
  _PurchasedCoursesControllerProviderElement(super.provider);

  @override
  List<String> get courseIds =>
      (origin as PurchasedCoursesControllerProvider).courseIds;
}

String _$updatePurchasedCoursesControllerHash() =>
    r'ddec9a0e2814e2c7b5b5252338e1066c1018a8c6';

/// See also [updatePurchasedCoursesController].
@ProviderFor(updatePurchasedCoursesController)
const updatePurchasedCoursesControllerProvider =
    UpdatePurchasedCoursesControllerFamily();

/// See also [updatePurchasedCoursesController].
class UpdatePurchasedCoursesControllerFamily extends Family<AsyncValue<bool>> {
  /// See also [updatePurchasedCoursesController].
  const UpdatePurchasedCoursesControllerFamily();

  /// See also [updatePurchasedCoursesController].
  UpdatePurchasedCoursesControllerProvider call(
    String courseId,
  ) {
    return UpdatePurchasedCoursesControllerProvider(
      courseId,
    );
  }

  @override
  UpdatePurchasedCoursesControllerProvider getProviderOverride(
    covariant UpdatePurchasedCoursesControllerProvider provider,
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
  String? get name => r'updatePurchasedCoursesControllerProvider';
}

/// See also [updatePurchasedCoursesController].
class UpdatePurchasedCoursesControllerProvider
    extends AutoDisposeFutureProvider<bool> {
  /// See also [updatePurchasedCoursesController].
  UpdatePurchasedCoursesControllerProvider(
    String courseId,
  ) : this._internal(
          (ref) => updatePurchasedCoursesController(
            ref as UpdatePurchasedCoursesControllerRef,
            courseId,
          ),
          from: updatePurchasedCoursesControllerProvider,
          name: r'updatePurchasedCoursesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updatePurchasedCoursesControllerHash,
          dependencies: UpdatePurchasedCoursesControllerFamily._dependencies,
          allTransitiveDependencies:
              UpdatePurchasedCoursesControllerFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  UpdatePurchasedCoursesControllerProvider._internal(
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
    FutureOr<bool> Function(UpdatePurchasedCoursesControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdatePurchasedCoursesControllerProvider._internal(
        (ref) => create(ref as UpdatePurchasedCoursesControllerRef),
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
    return _UpdatePurchasedCoursesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdatePurchasedCoursesControllerProvider &&
        other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdatePurchasedCoursesControllerRef
    on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `courseId` of this provider.
  String get courseId;
}

class _UpdatePurchasedCoursesControllerProviderElement
    extends AutoDisposeFutureProviderElement<bool>
    with UpdatePurchasedCoursesControllerRef {
  _UpdatePurchasedCoursesControllerProviderElement(super.provider);

  @override
  String get courseId =>
      (origin as UpdatePurchasedCoursesControllerProvider).courseId;
}

String _$updateBalanceControllerHash() =>
    r'a074735ef767bb18d6ec345e9dea710f53ec6718';

/// See also [updateBalanceController].
@ProviderFor(updateBalanceController)
const updateBalanceControllerProvider = UpdateBalanceControllerFamily();

/// See also [updateBalanceController].
class UpdateBalanceControllerFamily extends Family<AsyncValue<void>> {
  /// See also [updateBalanceController].
  const UpdateBalanceControllerFamily();

  /// See also [updateBalanceController].
  UpdateBalanceControllerProvider call(
    int change,
  ) {
    return UpdateBalanceControllerProvider(
      change,
    );
  }

  @override
  UpdateBalanceControllerProvider getProviderOverride(
    covariant UpdateBalanceControllerProvider provider,
  ) {
    return call(
      provider.change,
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
  String? get name => r'updateBalanceControllerProvider';
}

/// See also [updateBalanceController].
class UpdateBalanceControllerProvider extends AutoDisposeFutureProvider<void> {
  /// See also [updateBalanceController].
  UpdateBalanceControllerProvider(
    int change,
  ) : this._internal(
          (ref) => updateBalanceController(
            ref as UpdateBalanceControllerRef,
            change,
          ),
          from: updateBalanceControllerProvider,
          name: r'updateBalanceControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$updateBalanceControllerHash,
          dependencies: UpdateBalanceControllerFamily._dependencies,
          allTransitiveDependencies:
              UpdateBalanceControllerFamily._allTransitiveDependencies,
          change: change,
        );

  UpdateBalanceControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.change,
  }) : super.internal();

  final int change;

  @override
  Override overrideWith(
    FutureOr<void> Function(UpdateBalanceControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: UpdateBalanceControllerProvider._internal(
        (ref) => create(ref as UpdateBalanceControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        change: change,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _UpdateBalanceControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UpdateBalanceControllerProvider && other.change == change;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, change.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin UpdateBalanceControllerRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `change` of this provider.
  int get change;
}

class _UpdateBalanceControllerProviderElement
    extends AutoDisposeFutureProviderElement<void>
    with UpdateBalanceControllerRef {
  _UpdateBalanceControllerProviderElement(super.provider);

  @override
  int get change => (origin as UpdateBalanceControllerProvider).change;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

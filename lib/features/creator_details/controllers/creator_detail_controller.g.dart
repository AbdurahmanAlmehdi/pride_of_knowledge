// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$creatorCoursesControllerHash() =>
    r'a2265a3b02c1e700d1226badd52631086addc5b7';

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

/// See also [creatorCoursesController].
@ProviderFor(creatorCoursesController)
const creatorCoursesControllerProvider = CreatorCoursesControllerFamily();

/// See also [creatorCoursesController].
class CreatorCoursesControllerFamily extends Family<AsyncValue<List<Course>>> {
  /// See also [creatorCoursesController].
  const CreatorCoursesControllerFamily();

  /// See also [creatorCoursesController].
  CreatorCoursesControllerProvider call(
    String creatorId,
  ) {
    return CreatorCoursesControllerProvider(
      creatorId,
    );
  }

  @override
  CreatorCoursesControllerProvider getProviderOverride(
    covariant CreatorCoursesControllerProvider provider,
  ) {
    return call(
      provider.creatorId,
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
  String? get name => r'creatorCoursesControllerProvider';
}

/// See also [creatorCoursesController].
class CreatorCoursesControllerProvider
    extends AutoDisposeFutureProvider<List<Course>> {
  /// See also [creatorCoursesController].
  CreatorCoursesControllerProvider(
    String creatorId,
  ) : this._internal(
          (ref) => creatorCoursesController(
            ref as CreatorCoursesControllerRef,
            creatorId,
          ),
          from: creatorCoursesControllerProvider,
          name: r'creatorCoursesControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$creatorCoursesControllerHash,
          dependencies: CreatorCoursesControllerFamily._dependencies,
          allTransitiveDependencies:
              CreatorCoursesControllerFamily._allTransitiveDependencies,
          creatorId: creatorId,
        );

  CreatorCoursesControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.creatorId,
  }) : super.internal();

  final String creatorId;

  @override
  Override overrideWith(
    FutureOr<List<Course>> Function(CreatorCoursesControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreatorCoursesControllerProvider._internal(
        (ref) => create(ref as CreatorCoursesControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        creatorId: creatorId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Course>> createElement() {
    return _CreatorCoursesControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatorCoursesControllerProvider &&
        other.creatorId == creatorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, creatorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreatorCoursesControllerRef
    on AutoDisposeFutureProviderRef<List<Course>> {
  /// The parameter `creatorId` of this provider.
  String get creatorId;
}

class _CreatorCoursesControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<Course>>
    with CreatorCoursesControllerRef {
  _CreatorCoursesControllerProviderElement(super.provider);

  @override
  String get creatorId =>
      (origin as CreatorCoursesControllerProvider).creatorId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

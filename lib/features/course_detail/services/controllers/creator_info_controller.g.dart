// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creator_info_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$creatorInfoControllerHash() =>
    r'1cf036665b679a25a1ba0906c4913d1b3d907a73';

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

/// See also [creatorInfoController].
@ProviderFor(creatorInfoController)
const creatorInfoControllerProvider = CreatorInfoControllerFamily();

/// See also [creatorInfoController].
class CreatorInfoControllerFamily extends Family<AsyncValue<Creator>> {
  /// See also [creatorInfoController].
  const CreatorInfoControllerFamily();

  /// See also [creatorInfoController].
  CreatorInfoControllerProvider call(
    String creatorId,
  ) {
    return CreatorInfoControllerProvider(
      creatorId,
    );
  }

  @override
  CreatorInfoControllerProvider getProviderOverride(
    covariant CreatorInfoControllerProvider provider,
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
  String? get name => r'creatorInfoControllerProvider';
}

/// See also [creatorInfoController].
class CreatorInfoControllerProvider extends FutureProvider<Creator> {
  /// See also [creatorInfoController].
  CreatorInfoControllerProvider(
    String creatorId,
  ) : this._internal(
          (ref) => creatorInfoController(
            ref as CreatorInfoControllerRef,
            creatorId,
          ),
          from: creatorInfoControllerProvider,
          name: r'creatorInfoControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$creatorInfoControllerHash,
          dependencies: CreatorInfoControllerFamily._dependencies,
          allTransitiveDependencies:
              CreatorInfoControllerFamily._allTransitiveDependencies,
          creatorId: creatorId,
        );

  CreatorInfoControllerProvider._internal(
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
    FutureOr<Creator> Function(CreatorInfoControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CreatorInfoControllerProvider._internal(
        (ref) => create(ref as CreatorInfoControllerRef),
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
  FutureProviderElement<Creator> createElement() {
    return _CreatorInfoControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CreatorInfoControllerProvider &&
        other.creatorId == creatorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, creatorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CreatorInfoControllerRef on FutureProviderRef<Creator> {
  /// The parameter `creatorId` of this provider.
  String get creatorId;
}

class _CreatorInfoControllerProviderElement
    extends FutureProviderElement<Creator> with CreatorInfoControllerRef {
  _CreatorInfoControllerProviderElement(super.provider);

  @override
  String get creatorId => (origin as CreatorInfoControllerProvider).creatorId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

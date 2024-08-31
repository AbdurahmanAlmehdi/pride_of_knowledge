// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$courseSectionsControllerHash() =>
    r'2d53c9b0cdb1a9a9d8c3e3ed4dd00741d6f5ab29';

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

/// See also [courseSectionsController].
@ProviderFor(courseSectionsController)
const courseSectionsControllerProvider = CourseSectionsControllerFamily();

/// See also [courseSectionsController].
class CourseSectionsControllerFamily extends Family<AsyncValue<List<Section>>> {
  /// See also [courseSectionsController].
  const CourseSectionsControllerFamily();

  /// See also [courseSectionsController].
  CourseSectionsControllerProvider call(
    String courseId,
  ) {
    return CourseSectionsControllerProvider(
      courseId,
    );
  }

  @override
  CourseSectionsControllerProvider getProviderOverride(
    covariant CourseSectionsControllerProvider provider,
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
  String? get name => r'courseSectionsControllerProvider';
}

/// See also [courseSectionsController].
class CourseSectionsControllerProvider
    extends AutoDisposeFutureProvider<List<Section>> {
  /// See also [courseSectionsController].
  CourseSectionsControllerProvider(
    String courseId,
  ) : this._internal(
          (ref) => courseSectionsController(
            ref as CourseSectionsControllerRef,
            courseId,
          ),
          from: courseSectionsControllerProvider,
          name: r'courseSectionsControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$courseSectionsControllerHash,
          dependencies: CourseSectionsControllerFamily._dependencies,
          allTransitiveDependencies:
              CourseSectionsControllerFamily._allTransitiveDependencies,
          courseId: courseId,
        );

  CourseSectionsControllerProvider._internal(
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
    FutureOr<List<Section>> Function(CourseSectionsControllerRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CourseSectionsControllerProvider._internal(
        (ref) => create(ref as CourseSectionsControllerRef),
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
  AutoDisposeFutureProviderElement<List<Section>> createElement() {
    return _CourseSectionsControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CourseSectionsControllerProvider &&
        other.courseId == courseId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, courseId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin CourseSectionsControllerRef
    on AutoDisposeFutureProviderRef<List<Section>> {
  /// The parameter `courseId` of this provider.
  String get courseId;
}

class _CourseSectionsControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<Section>>
    with CourseSectionsControllerRef {
  _CourseSectionsControllerProviderElement(super.provider);

  @override
  String get courseId => (origin as CourseSectionsControllerProvider).courseId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

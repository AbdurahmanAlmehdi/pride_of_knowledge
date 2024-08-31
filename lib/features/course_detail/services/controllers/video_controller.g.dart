// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videosControllerHash() => r'5cda992bf4f329302904d916db4181efa5f75b31';

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

/// See also [videosController].
@ProviderFor(videosController)
const videosControllerProvider = VideosControllerFamily();

/// See also [videosController].
class VideosControllerFamily extends Family<AsyncValue<List<Video>>> {
  /// See also [videosController].
  const VideosControllerFamily();

  /// See also [videosController].
  VideosControllerProvider call(
    String sectionId,
  ) {
    return VideosControllerProvider(
      sectionId,
    );
  }

  @override
  VideosControllerProvider getProviderOverride(
    covariant VideosControllerProvider provider,
  ) {
    return call(
      provider.sectionId,
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
  String? get name => r'videosControllerProvider';
}

/// See also [videosController].
class VideosControllerProvider extends AutoDisposeFutureProvider<List<Video>> {
  /// See also [videosController].
  VideosControllerProvider(
    String sectionId,
  ) : this._internal(
          (ref) => videosController(
            ref as VideosControllerRef,
            sectionId,
          ),
          from: videosControllerProvider,
          name: r'videosControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$videosControllerHash,
          dependencies: VideosControllerFamily._dependencies,
          allTransitiveDependencies:
              VideosControllerFamily._allTransitiveDependencies,
          sectionId: sectionId,
        );

  VideosControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sectionId,
  }) : super.internal();

  final String sectionId;

  @override
  Override overrideWith(
    FutureOr<List<Video>> Function(VideosControllerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VideosControllerProvider._internal(
        (ref) => create(ref as VideosControllerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sectionId: sectionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Video>> createElement() {
    return _VideosControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideosControllerProvider && other.sectionId == sectionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sectionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VideosControllerRef on AutoDisposeFutureProviderRef<List<Video>> {
  /// The parameter `sectionId` of this provider.
  String get sectionId;
}

class _VideosControllerProviderElement
    extends AutoDisposeFutureProviderElement<List<Video>>
    with VideosControllerRef {
  _VideosControllerProviderElement(super.provider);

  @override
  String get sectionId => (origin as VideosControllerProvider).sectionId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

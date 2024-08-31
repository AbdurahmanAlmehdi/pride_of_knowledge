// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$videoPlayerHash() => r'0484023af93597d69a1cc0174a9cc7de9282a2bf';

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

/// See also [videoPlayer].
@ProviderFor(videoPlayer)
const videoPlayerProvider = VideoPlayerFamily();

/// See also [videoPlayer].
class VideoPlayerFamily extends Family<ChewieController> {
  /// See also [videoPlayer].
  const VideoPlayerFamily();

  /// See also [videoPlayer].
  VideoPlayerProvider call({
    required DataSourceType dataSourceType,
    required String url,
  }) {
    return VideoPlayerProvider(
      dataSourceType: dataSourceType,
      url: url,
    );
  }

  @override
  VideoPlayerProvider getProviderOverride(
    covariant VideoPlayerProvider provider,
  ) {
    return call(
      dataSourceType: provider.dataSourceType,
      url: provider.url,
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
  String? get name => r'videoPlayerProvider';
}

/// See also [videoPlayer].
class VideoPlayerProvider extends AutoDisposeProvider<ChewieController> {
  /// See also [videoPlayer].
  VideoPlayerProvider({
    required DataSourceType dataSourceType,
    required String url,
  }) : this._internal(
          (ref) => videoPlayer(
            ref as VideoPlayerRef,
            dataSourceType: dataSourceType,
            url: url,
          ),
          from: videoPlayerProvider,
          name: r'videoPlayerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$videoPlayerHash,
          dependencies: VideoPlayerFamily._dependencies,
          allTransitiveDependencies:
              VideoPlayerFamily._allTransitiveDependencies,
          dataSourceType: dataSourceType,
          url: url,
        );

  VideoPlayerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.dataSourceType,
    required this.url,
  }) : super.internal();

  final DataSourceType dataSourceType;
  final String url;

  @override
  Override overrideWith(
    ChewieController Function(VideoPlayerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VideoPlayerProvider._internal(
        (ref) => create(ref as VideoPlayerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        dataSourceType: dataSourceType,
        url: url,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<ChewieController> createElement() {
    return _VideoPlayerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VideoPlayerProvider &&
        other.dataSourceType == dataSourceType &&
        other.url == url;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, dataSourceType.hashCode);
    hash = _SystemHash.combine(hash, url.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin VideoPlayerRef on AutoDisposeProviderRef<ChewieController> {
  /// The parameter `dataSourceType` of this provider.
  DataSourceType get dataSourceType;

  /// The parameter `url` of this provider.
  String get url;
}

class _VideoPlayerProviderElement
    extends AutoDisposeProviderElement<ChewieController> with VideoPlayerRef {
  _VideoPlayerProviderElement(super.provider);

  @override
  DataSourceType get dataSourceType =>
      (origin as VideoPlayerProvider).dataSourceType;
  @override
  String get url => (origin as VideoPlayerProvider).url;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

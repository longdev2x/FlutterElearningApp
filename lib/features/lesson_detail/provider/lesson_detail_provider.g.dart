// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$lessonDetailHash() => r'4d53bac130703edd7ea8b0d099d80247eea791c6';

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

/// See also [lessonDetail].
@ProviderFor(lessonDetail)
const lessonDetailProvider = LessonDetailFamily();

/// See also [lessonDetail].
class LessonDetailFamily extends Family<AsyncValue<void>> {
  /// See also [lessonDetail].
  const LessonDetailFamily();

  /// See also [lessonDetail].
  LessonDetailProvider call({
    required int id,
  }) {
    return LessonDetailProvider(
      id: id,
    );
  }

  @override
  LessonDetailProvider getProviderOverride(
    covariant LessonDetailProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'lessonDetailProvider';
}

/// See also [lessonDetail].
class LessonDetailProvider extends AutoDisposeFutureProvider<void> {
  /// See also [lessonDetail].
  LessonDetailProvider({
    required int id,
  }) : this._internal(
          (ref) => lessonDetail(
            ref as LessonDetailRef,
            id: id,
          ),
          from: lessonDetailProvider,
          name: r'lessonDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$lessonDetailHash,
          dependencies: LessonDetailFamily._dependencies,
          allTransitiveDependencies:
              LessonDetailFamily._allTransitiveDependencies,
          id: id,
        );

  LessonDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<void> Function(LessonDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LessonDetailProvider._internal(
        (ref) => create(ref as LessonDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<void> createElement() {
    return _LessonDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LessonDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LessonDetailRef on AutoDisposeFutureProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _LessonDetailProviderElement
    extends AutoDisposeFutureProviderElement<void> with LessonDetailRef {
  _LessonDetailProviderElement(super.provider);

  @override
  int get id => (origin as LessonDetailProvider).id;
}

String _$lessonDataVideoHash() => r'e7be11b749ca5f140c8a5b32b4340270301fb2e1';

/// See also [LessonDataVideo].
@ProviderFor(LessonDataVideo)
final lessonDataVideoProvider =
    AutoDisposeAsyncNotifierProvider<LessonDataVideo, LessonVideo>.internal(
  LessonDataVideo.new,
  name: r'lessonDataVideoProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$lessonDataVideoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LessonDataVideo = AutoDisposeAsyncNotifier<LessonVideo>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

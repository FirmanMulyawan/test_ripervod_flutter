// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getListDataHash() => r'd37013a897afe9622921356e7d9e8d24a11ce0db';

/// See also [getListData].
@ProviderFor(getListData)
final getListDataProvider =
    AutoDisposeFutureProvider<List<Map<String, dynamic>>>.internal(
  getListData,
  name: r'getListDataProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$getListDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetListDataRef
    = AutoDisposeFutureProviderRef<List<Map<String, dynamic>>>;
String _$friendsNotifierHash() => r'3df32703eef4822845b6e09dedfbd432fa21e287';

/// See also [FriendsNotifier].
@ProviderFor(FriendsNotifier)
final friendsNotifierProvider =
    AutoDisposeNotifierProvider<FriendsNotifier, String>.internal(
  FriendsNotifier.new,
  name: r'friendsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$friendsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$FriendsNotifier = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

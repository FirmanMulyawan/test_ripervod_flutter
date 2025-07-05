// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$friendsListDataHash() => r'1ddfecc602028f4f2c7b4981b1e32017a87b4245';

/// See also [friendsListData].
@ProviderFor(friendsListData)
final friendsListDataProvider =
    AutoDisposeProvider<List<FriendsV2Response>>.internal(
  friendsListData,
  name: r'friendsListDataProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$friendsListDataHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FriendsListDataRef = AutoDisposeProviderRef<List<FriendsV2Response>>;
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

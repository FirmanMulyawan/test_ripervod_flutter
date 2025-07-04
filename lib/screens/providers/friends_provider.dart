import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../component/api/api_client.dart';
import '../../component/api/models/friends_response.dart';
import '../../component/config/app_config.dart';

part 'friends_provider.g.dart';

var apiClient = getIt.get<ApiClient>();

@riverpod
Future<List<Map<String, dynamic>>> getListData(ref) async {
  try {
    final FriendsResponse friendsData = await apiClient.getListData();

    final rawList = friendsData.results;
    final Map<String, dynamic> grouped2 = {};

    for (var user in rawList!) {
      final firstName = user.name?.first as String;
      final firstLetter = firstName[0].toUpperCase();

      grouped2.putIfAbsent(firstLetter, () => []);
      grouped2[firstLetter].add(user.toJson());
    }

    final sortedData = grouped2.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));

    final data = sortedData.map((entry) {
      return {
        "name": entry.key,
        "result": entry.value,
      };
    }).toList();

    return data;
  } catch (e) {
    rethrow;
  }
}

@riverpod
class FriendsNotifier extends _$FriendsNotifier {
  @override
  String build() {
    return 'A';
  }

  void setTab(String newLetter) {
    if (newLetter != state) {
      state = newLetter;
    }
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../component/api/models/friends_v2_response.dart';

// import '../../component/api/api_client.dart';
// import '../../component/api/models/friends_response.dart';
// import '../../component/config/app_config.dart';

part 'friends_provider.g.dart';

// var apiClient = getIt.get<ApiClient>();

// @riverpod
// Future<List<Map<String, dynamic>>> getListData(ref) async {
//   try {
//     final FriendsResponse friendsData = await apiClient.getListData();

//     final rawList = friendsData.results;
//     final Map<String, dynamic> grouped2 = {};

//     for (var user in rawList!) {
//       final firstName = user.name?.first as String;
//       final firstLetter = firstName[0].toUpperCase();

//       grouped2.putIfAbsent(firstLetter, () => []);
//       grouped2[firstLetter].add(user.toJson());
//     }

//     final sortedData = grouped2.entries.toList()
//       ..sort((a, b) => a.key.compareTo(b.key));

//     final data = sortedData.map((entry) {
//       return {
//         "name": entry.key,
//         "result": entry.value,
//       };
//     }).toList();

//     return data;
//   } catch (e) {
//     rethrow;
//   }
// }

final List<FriendsV2Response> friendsList = [
  FriendsV2Response(group: 'A', result: [
    ResultV2(name: "A.HADI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ABDUL", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ADI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ADE", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "AGAH", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "AGUNG", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "AJI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ALFI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ANDI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ANGGIH", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ARIS", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ATEP", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'B', result: [
    ResultV2(name: "BAMBANG", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "BAYU", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "BERLAN", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'C', result: [
    ResultV2(name: "CECEP SUHERLAN", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'D', result: [
    ResultV2(name: "DADANG", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DEDEN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DEDE", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DEVI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DIAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DIKI K", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DIO", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DONI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DUDIH", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DUDUNG", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "DWI", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'E', result: [
    ResultV2(name: "EDI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "EGI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ENCEP", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "EKO", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ERY", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'F', result: [
    ResultV2(name: "FAJAR", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "FALAR", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "FASYA", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "FERRY", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'G', result: [
    ResultV2(name: "GUMILAR", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "GUNTUR", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'H', result: [
    ResultV2(name: "HASAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "HENDI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "HILMAN", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'I', result: [
    ResultV2(name: "IDUN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "ILHAM", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "IMAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "IPUR", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "IRVAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "IWAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "IQBAL", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "IVAN", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'J', result: [
    ResultV2(name: "JESSICA", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "JUJU", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "JULHAIDI", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'K', result: [
    ResultV2(name: "KARMAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "KASIH", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "KUSNADI", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'L', result: [
    ResultV2(name: "LILI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "LILIS", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "LITA", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'M', result: [
    ResultV2(name: "MAADI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "META", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "M.TITO", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "MUSTOFA", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'N', result: [
    ResultV2(name: "NANANG", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "NILA", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "NIKO", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "NITA", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'P', result: [
    ResultV2(name: "PANGGIH", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'R', result: [
    ResultV2(name: "REFI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RENI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RISAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RISKA", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RIZAL", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RIZKI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RONY", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RUDI H", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RULI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "RUHIYAT", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'S', result: [
    ResultV2(name: "SOPIYAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "SONY", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "SRI", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "SULAEMAN", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'T', result: [
    ResultV2(name: "TAUFIK", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "TANTAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "TITO A", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "TOMMY", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "TRIANA", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'U', result: [
    ResultV2(name: "UJANG", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "UNO", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'W', result: [
    ResultV2(name: "WAHYUDIN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "WILDAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "WILLY", imageUrl: "https://cataas.com/cat"),
  ]),
  FriendsV2Response(group: 'Y', result: [
    ResultV2(name: "YANTO", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "YAYAN", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "YAYANG", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "YUSEP", imageUrl: "https://cataas.com/cat"),
    ResultV2(name: "YUSUF", imageUrl: "https://cataas.com/cat"),
  ]),
];

@riverpod
List<FriendsV2Response> friendsListData(ref) {
  return friendsList;
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

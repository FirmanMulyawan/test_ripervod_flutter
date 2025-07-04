import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../home/friends_screen.dart';

part 'tab_provider.g.dart';

List<Widget> screenList = [
  const FriendsScreen(),
  const Text("saaa"),
  const Text("yuuu"),
];

@riverpod
List<Widget> listScreen(ref) {
  return screenList;
}

@riverpod
class TabNotifier extends _$TabNotifier {
  @override
  int build() {
    return 0;
  }

  void setTab(int index) {
    state = index;
  }
}

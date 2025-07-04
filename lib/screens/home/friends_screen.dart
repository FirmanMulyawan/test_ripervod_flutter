import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../component/config/app_style.dart';
import '../providers/friends_provider.dart';

class FriendsScreen extends ConsumerStatefulWidget {
  const FriendsScreen({super.key});

  @override
  ConsumerState<FriendsScreen> createState() => _FriendsScreenState();
}

class _FriendsScreenState extends ConsumerState<FriendsScreen> {
  final ScrollController scrollController = ScrollController();
  final Map<String, GlobalKey> _keysMap = {};

  @override
  Widget build(BuildContext context) {
    final getListData = ref.watch(getListDataProvider);
    final activeIndex = ref.watch(friendsNotifierProvider);

    Future<void> refresh() async {
      ref.invalidate(getListDataProvider);
      await ref.read(getListDataProvider.future);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: AppStyle.blue2,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Center(
              child: Icon(
                Icons.people,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              height: 1,
              color: AppStyle.grey,
            ),
          ),
          getListData.when(
              data: (data) {
                return Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: RefreshIndicator(
                          onRefresh: refresh,
                          child: ListView.builder(
                              controller: scrollController,
                              itemCount: getListData.value?.length ?? 0,
                              padding: const EdgeInsets.only(bottom: 200),
                              itemBuilder: (context, index) {
                                final users =
                                    getListData.value?[index]["result"];
                                final name = getListData.value?[index]['name'];

                                _keysMap.putIfAbsent(name, () => GlobalKey());

                                return VisibilityDetector(
                                  key: Key('$name'),
                                  onVisibilityChanged: (info) {
                                    final String currentLetter =
                                        getListData.value?[index]['name'];

                                    final String? lastActive =
                                        ref.watch(friendsNotifierProvider);

                                    if (currentLetter != lastActive) {
                                      ref
                                          .read(
                                              friendsNotifierProvider.notifier)
                                          .setTab(currentLetter);
                                    }
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          key: _keysMap[name],
                                          "${getListData.value?[index]['name']}",
                                          style: AppStyle.rubikSemiBold(
                                              size: 20,
                                              textColor: AppStyle.black)),
                                      ...users.map((user) {
                                        final name = user['name'];
                                        final first = name['first'];
                                        final picture =
                                            user['picture']['medium'];

                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  picture,
                                                  width: 50,
                                                  height: 50,
                                                  fit: BoxFit.cover,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return SizedBox(
                                                      width: 50,
                                                      height: 50,
                                                      child: Center(
                                                        child:
                                                            CircularProgressIndicator(
                                                          strokeWidth: 2,
                                                          value: loadingProgress
                                                                      .expectedTotalBytes !=
                                                                  null
                                                              ? loadingProgress
                                                                      .cumulativeBytesLoaded /
                                                                  (loadingProgress
                                                                          .expectedTotalBytes ??
                                                                      1)
                                                              : null,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Container(
                                                      width: 50,
                                                      height: 50,
                                                      color:
                                                          Colors.grey.shade300,
                                                      child: const Icon(
                                                          Icons.error,
                                                          size: 24),
                                                    );
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                "$first",
                                                style: AppStyle.rubikRegular(
                                                    size: 15),
                                              )
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                );
                              }),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        width: 40,
                        child: ListView.builder(
                            itemCount: getListData.value?.length ?? 0,
                            padding: const EdgeInsets.only(bottom: 200),
                            itemBuilder: (context, index) {
                              final name = getListData.value?[index]['name'];
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      final contextKey =
                                          _keysMap[name]?.currentContext;

                                      if (contextKey != null) {
                                        WidgetsBinding.instance
                                            .addPostFrameCallback((_) {
                                          Scrollable.ensureVisible(
                                            contextKey,
                                            duration: const Duration(
                                                milliseconds: 300),
                                          );
                                        });

                                        ref
                                            .read(friendsNotifierProvider
                                                .notifier)
                                            .setTab(name);
                                      }
                                    },
                                    child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: activeIndex == name
                                              ? AppStyle.blue2
                                              : AppStyle.grey2,
                                          borderRadius:
                                              BorderRadius.circular(30),
                                        ),
                                        child: Center(
                                            child: Text('$name',
                                                style: AppStyle.rubikRegular(
                                                  textColor: AppStyle.grey,
                                                )))),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  )
                                ],
                              );
                            }),
                      )
                    ],
                  ),
                );
              },
              error: (error, stack) => Center(
                    child: Text("Error: $error"),
                  ),
              loading: () => const Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}

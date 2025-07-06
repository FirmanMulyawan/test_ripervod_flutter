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
    final friendsListData = ref.watch(friendsListDataProvider);
    final activeIndex = ref.watch(friendsNotifierProvider);

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
          Expanded(
              child: Row(children: [
            Expanded(
                child: ListView.builder(
                    itemCount: friendsListData.length,
                    controller: scrollController,
                    padding: const EdgeInsets.only(bottom: 200),
                    itemBuilder: (context, index) {
                      final users = friendsListData[index].result;
                      final group = friendsListData[index].group ?? '';

                      _keysMap.putIfAbsent(group, () => GlobalKey());

                      return VisibilityDetector(
                        // onVisibilityChanged: (info) {
                        //   final String group =
                        //       friendsListData[index].group ?? '';
                        //   final String? lastActive =
                        //       ref.watch(friendsNotifierProvider);

                        //   if (group != lastActive) {
                        //     ref
                        //         .read(friendsNotifierProvider.notifier)
                        //         .setTab(group);
                        //   }
                        // },
                        key: Key('user-item-$index'),
                        onVisibilityChanged: (info) {
                          if (info.visibleFraction > 0.5) {
                            ref
                                .read(friendsNotifierProvider.notifier)
                                .setTab(group);
                          }
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  key: _keysMap[group],
                                  group,
                                  style: AppStyle.rubikSemiBold(
                                      size: 20, textColor: AppStyle.black)),
                              ...users!.map((user) {
                                final name = user.name;
                                final imageUrl = user.imageUrl;

                                return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            imageUrl ?? '-',
                                            width: 50,
                                            height: 50,
                                            fit: BoxFit.cover,
                                            loadingBuilder: (context, child,
                                                loadingProgress) {
                                              if (loadingProgress == null) {
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
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Container(
                                                width: 50,
                                                height: 50,
                                                color: Colors.grey.shade300,
                                                child: const Icon(Icons.error,
                                                    size: 24),
                                              );
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "$name",
                                          style:
                                              AppStyle.rubikRegular(size: 15),
                                        )
                                      ],
                                    ));
                              }),
                            ]),
                      );
                    })),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 40,
              child: ListView.builder(
                  itemCount: friendsListData.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final group = friendsListData[index].group;
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            final contextKey = _keysMap[group]?.currentContext;
                            if (contextKey != null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                Scrollable.ensureVisible(
                                  contextKey,
                                  duration: const Duration(milliseconds: 300),
                                );
                              });

                              ref
                                  .read(friendsNotifierProvider.notifier)
                                  .setTab(group ?? '');
                            }
                          },
                          child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: activeIndex == group
                                    ? AppStyle.blue2
                                    : AppStyle.grey2,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                  child: Text('$group',
                                      style: AppStyle.rubikRegular(
                                        size: 12,
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
          ]))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../component/config/app_style.dart';
import '../providers/tab_provider.dart';

class TabScreen extends ConsumerWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndex = ref.watch(tabNotifierProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _tabSection(tabIndex, ref),
      ],
    );
  }

  Widget _tabSection(int tabIndex, WidgetRef ref) {
    double isHeight = 40;

    return Container(
      margin: const EdgeInsets.only(left: 20),
      child: SizedBox(
        height: 35,
        child: Row(children: [
          _friendButton(isHeight, tabIndex, ref),
          const SizedBox(
            width: 20,
          ),
          _groupButton(isHeight, tabIndex, ref),
          const SizedBox(
            width: 20,
          ),
          _systemButton(isHeight, tabIndex, ref),
        ]),
      ),
    );
  }

  Widget _friendButton(double height, int tabIndex, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(tabNotifierProvider.notifier).setTab(0);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: height,
        decoration: BoxDecoration(
          color: tabIndex == 0 ? AppStyle.blue2 : AppStyle.grey2,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            'friends',
            style: AppStyle.rubikRegular(
              size: 15,
              textColor: tabIndex == 0 ? AppStyle.bluePrimary : AppStyle.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _groupButton(double height, int tabIndex, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(tabNotifierProvider.notifier).setTab(1);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: height,
        decoration: BoxDecoration(
          color: tabIndex == 1 ? AppStyle.blue2 : AppStyle.grey2,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text('group',
              style: AppStyle.rubikRegular(
                size: 15,
                textColor: tabIndex == 1 ? AppStyle.bluePrimary : AppStyle.grey,
              )),
        ),
      ),
    );
  }

  Widget _systemButton(double height, int tabIndex, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref.read(tabNotifierProvider.notifier).setTab(2);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: height,
        decoration: BoxDecoration(
          color: tabIndex == 2 ? AppStyle.blue2 : AppStyle.grey2,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text('system',
              style: AppStyle.rubikRegular(
                size: 15,
                textColor: tabIndex == 2 ? AppStyle.bluePrimary : AppStyle.grey,
              )),
        ),
      ),
    );
  }
}

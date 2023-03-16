import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotelio/src/config/app_assets.dart';
import 'package:hotelio/src/config/app_colors.dart';
import 'package:hotelio/src/controllers/homeC.dart';

class HomeScreen extends StatelessWidget {
  final homeC = Get.put(HomeC());
  final List<Map> listNav = [
    {'icon': AppAsset.nearby, 'label': 'Nearby'},
    {'icon': AppAsset.history, 'label': 'History'},
    {'icon': AppAsset.payment, 'label': 'Payment'},
    {'icon': AppAsset.gift, 'label': 'Reward'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (homeC.pageIndex == 1) {
          return Center(
            child: Text('History'),
          );
        } else {
          return Center(
            child: Text('Nearby'),
          );
        }
      }),
      bottomNavigationBar: Obx(() {
        return Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            top: 8,
            bottom: 10,
          ),
          child: BottomNavigationBar(
            currentIndex: homeC.pageIndex,
            onTap: (value) => homeC.pageIndex = value,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black54,
            selectedIconTheme: const IconThemeData(
              color: AppColor.primaryC,
            ),
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            selectedFontSize: 12,
            items: listNav.map((e) {
              return BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(e['icon'])),
                label: e['label'],
              );
            }).toList(),
          ),
        );
      }),
    );
  }
}

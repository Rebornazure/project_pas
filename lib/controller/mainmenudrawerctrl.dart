import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pas/menu/feat.dart';
import 'package:project_pas/menu/home.dart';
import 'package:project_pas/menu/profile.dart';

class MainMenuDrawerController extends GetxController {
  final RxInt selectedIndex = 0.obs;
  final List<Widget> listPages = const [HomePage(), FeatPage(), ProfilePage()];

  void changeIndex(int index) {
    if (index >= 0 && index < listPages.length) {
      selectedIndex.value = index;
    }
  }
}

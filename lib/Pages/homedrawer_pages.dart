import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_pas/controller/mainmenudrawerctrl.dart';

class MainMenuDrawer extends StatelessWidget {
  MainMenuDrawer({super.key});

  final MainMenuDrawerController menuDrawerController = Get.put(
    MainMenuDrawerController(),
  );
  static const labels = ['Home', 'Feat', 'Profile'];

  @override
  Widget build(BuildContext context) => Obx(
    () => Scaffold(
      backgroundColor: const Color(0xFFF4F7F5),
      appBar: AppBar(
        title: const Text(
          'PAS Project',
          style: TextStyle(fontWeight: FontWeight.w800),
        ),
        backgroundColor: const Color(0xFFF4F7F5),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Center(
              child: Text(
                labels[menuDrawerController.selectedIndex.value],
                style: const TextStyle(
                  color: Color(0xFF087E72),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: NavigationDrawer(
        selectedIndex: menuDrawerController.selectedIndex.value,
        onDestinationSelected: (index) {
          menuDrawerController.changeIndex(index);
          Navigator.pop(context);
        },
        children: const [
          Padding(
            padding: EdgeInsets.fromLTRB(28, 24, 16, 16),
            child: Text(
              'PAS PROJECT',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF173B35),
              ),
            ),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: Text('Home'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.sports_soccer_outlined),
            selectedIcon: Icon(Icons.sports_soccer),
            label: Text('Feat'),
          ),
          NavigationDrawerDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: Text('Profile'),
          ),
        ],
      ),
      body: IndexedStack(
        index: menuDrawerController.selectedIndex.value,
        children: menuDrawerController.listPages,
      ),
    ),
  );
}

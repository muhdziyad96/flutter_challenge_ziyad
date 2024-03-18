import 'package:flutter/material.dart';
import 'package:flutter_challenge_ziyad/constant/color.dart';
import 'package:flutter_challenge_ziyad/controller/home_controller.dart';
import 'package:flutter_challenge_ziyad/screen/main/main_screen.dart';
import 'package:flutter_challenge_ziyad/screen/profile/profile_screen.dart';
import 'package:flutter_challenge_ziyad/screen/setting/setting_screen.dart';
import 'package:get/get.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  HomeController h = Get.find();

  final List<NavItem> _navItems = [
    NavItem(Icons.home, "Home"),
    NavItem(Icons.people, "Profile"),
    NavItem(Icons.settings, "Setting"),
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      h.changeTabIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: primaryColor,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: _navItems.map((item) {
            var index = _navItems.indexOf(item);
            return IconButton(
              onPressed: () => _onNavItemTapped(index),
              icon: Icon(
                item.icon,
                color: h.tabIndex == index ? whiteColor : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ),
      body: IndexedStack(
        index: h.tabIndex,
        children: const [
          MainScreen(),
          ProfileScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}

class NavItem {
  IconData icon;
  String title;

  NavItem(this.icon, this.title);
}

import 'package:amit_course1/Screen/order_screen.dart';
import 'package:amit_course1/Screen/profile_screen.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'drawer_screen.dart';

class NavigatorScreen extends StatelessWidget {
  NavigatorScreen({Key? key}) : super(key: key);
  final _currentIndex = ValueNotifier<int>(0);
  final List<Widget> _navigationScreens = [
    ProfileScreen(),
    const OrderScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentIndex,
      builder: (BuildContext context, int value, Widget? child) {
        return Scaffold(
          drawer: const DrawerScreen(),
          body: _navigationScreens.elementAt(_currentIndex.value),
          bottomNavigationBar: CustomNavigationBar(
            onTap: (int index) => _currentIndex.value = index,
            currentIndex: _currentIndex.value,
            backgroundColor: Colors.amber.shade700,
            isFloating: true,
            scaleFactor: 0.5,
            strokeColor: Colors.transparent,
            elevation: 1,
            selectedColor: const Color(0xff000053),
            unSelectedColor: const Color(0xff800000),
            borderRadius: const Radius.circular(10),
            iconSize: 28,
            items: [
              CustomNavigationBarItem(
                icon: const FaIcon(FontAwesomeIcons.person),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.restaurant_menu),
              ),
            ],
          ),
        );
      },
    );
  }
}

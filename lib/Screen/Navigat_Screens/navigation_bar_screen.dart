import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../menu_screen.dart';
import '../order_screen.dart';
import '../profile_screen.dart';
import 'drawer_screen.dart';

final position = StateProvider((ref) => 0);

class NavigatorScreen extends HookConsumerWidget {
  NavigatorScreen({Key? key}) : super(key: key);
  final List<Widget> _navigationScreens = [
    ProfileScreen(),
    const OrderScreen(),
    const MenuScreen(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int positionOfScreen = ref.watch(position);
    return Scaffold(
      drawer: const DrawerScreen(),
      body: _navigationScreens.elementAt(positionOfScreen),
      bottomNavigationBar: CustomNavigationBar(
        onTap: (int index) => ref.watch(position.notifier).update((state) => index),
        currentIndex: positionOfScreen,
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
            icon: const Icon(Icons.drive_eta),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.restaurant_menu),
          ),
        ],
      ),
    );
  }
}

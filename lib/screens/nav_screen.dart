import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grabit/screens/settings_screen.dart';
import 'package:iconsax/iconsax.dart';

import '../constants.dart';
import 'account_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'order_screen.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> screens = [
    HomeScreen(),
    OrderScreen(),
    AccountScreen(),
    SettingsScreen(),
  ];
  final Map<String, IconData> _icons = const {
    'Home': Iconsax.home,
    'Orders': Iconsax.shopping_bag,
    'Account': Iconsax.profile_2user,
    'Settings': Iconsax.setting
  };
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GestureDetector(
        onTap: () {
          showCupertinoModalPopup(
              context: context, builder: (context) => CartScreen());
        },
        child: PhysicalModel(
          color: primaryColor,
          shape: BoxShape.circle,
          elevation: 10,
          shadowColor: primaryColor,
          child: Container(
            child: const Icon(Iconsax.shopping_cart,
                color: Colors.white, size: 30),
            decoration: BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            height: 50,
            width: 50,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      resizeToAvoidBottomInset: false,
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue.shade100,
        items: _icons
            .map((title, icon) => MapEntry(
                title,
                BottomNavigationBarItem(
                  icon: Icon(
                    icon,
                    size: 25.0,
                  ),
                  label: title,
                  tooltip: title,
                )))
            .values
            .toList(),
        currentIndex: _currentIndex,
        selectedItemColor: homeHeadingColor,
        selectedFontSize: 10,
        unselectedItemColor: Colors.black,
        unselectedFontSize: 10,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}

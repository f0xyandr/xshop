import 'package:flutter/material.dart';

class BottomNavigationDestinations {
  static const List<Widget> destinations = <NavigationDestination>[
    NavigationDestination(
      selectedIcon: Icon(Icons.home),
      icon: Icon(Icons.home_outlined),
      label: 'Home',
    ),
    NavigationDestination(
      icon: Badge(child: Icon(Icons.category)),
      label: 'Categories',
    ),
    NavigationDestination(
      icon: Badge(child: Icon(Icons.person_2)),
      label: 'Profile',
    ),
  ];
}

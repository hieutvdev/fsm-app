import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

final bottomNavigationBarItems = <BottomNavigationBarItem>[
  const BottomNavigationBarItem(
    icon: Icon(Iconsax.home),
    label: 'Home',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Iconsax.people),
    label: 'Community',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Iconsax.chart),
    label: 'Stock',
  ),
  const BottomNavigationBarItem(
    icon: Icon(Iconsax.user),
    label: 'Profile',
  ),
];

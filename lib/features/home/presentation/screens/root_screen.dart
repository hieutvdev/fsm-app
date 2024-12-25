import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/config/constants/bottom_navigation_bar_item.dart';
import 'package:fsm_app/config/theme/colors/app_colors.dart';
import 'package:fsm_app/features/home/presentation/screens/home_screen.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final List pages = <Widget>[
    const HomeScreen(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        unselectedItemColor: context.isDarkMode
            ? AppColors.unselectedItemColorDark
            : AppColors.unselectedItemColorLight,
        selectedItemColor: context.isDarkMode
            ? AppColors.selectedItemColorDark
            : AppColors.selectedItemColorLight,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {});
          _currentIndex = index;
        },
        backgroundColor: context.isDarkMode
            ? AppColors.darkBackground
            : AppColors.lightBackground,
        items: bottomNavigationBarItems,
      ),
      body: pages[_currentIndex],
    );
  }
}

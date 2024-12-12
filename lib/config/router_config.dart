import 'package:flutter/cupertino.dart';
import 'package:fsm_app/features/home/presentation/screens/home_screen.dart';
import 'package:fsm_app/features/search/presentation/screens/search_screen.dart';
import 'package:fsm_app/features/splash/presentation/screens/splash_screen.dart';

Map<String, WidgetBuilder> routeInit(BuildContext context) {
  return {
    '/home': (context) => const HomeScreen(),
    '/splash': (context) => const SplashScreen(),
    '/search': (context) => const SearchScreen(),
  };
}

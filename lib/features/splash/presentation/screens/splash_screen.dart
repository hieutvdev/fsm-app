import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/navigation/app_navigation.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/config/assets/app_images.dart';
import 'package:fsm_app/core/platform/network_info.dart';
import 'package:fsm_app/core/services/shared_preferences_service.dart';
import 'package:fsm_app/features/errors/presentation/screens/network_disconnect_screen.dart';
import 'package:fsm_app/features/home/presentation/screens/root_screen.dart';
import 'package:get_it/get_it.dart';

import '../../../onboarding/presentation/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late NetworkInfo networkInfo;
  late SharedPreferencesService sharedPreferencesService;
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    networkInfo = GetIt.instance<NetworkInfo>();
    sharedPreferencesService = GetIt.instance<SharedPreferencesService>();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _opacityAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.repeat(reverse: true);
    redirect();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String logoPath =
        context.isDarkMode ? AppImages.appLogoDark : AppImages.appLogoLight;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        child: FadeTransition(
          opacity: _opacityAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                logoPath,
                width: 100,
                height: 100,
              ),
              Text("FSM App",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: context.isDarkMode ? Colors.white : Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> redirect() async {
    bool isConnected = await networkInfo.isConnected;
    if (isConnected) {
      await Future.delayed(const Duration(seconds: 2));
      bool isFirstTime = await sharedPreferencesService.getBool("isFirstTime");
      if (!isFirstTime) {
        await sharedPreferencesService.saveBool("isFirstTime", true);
        AppNavigation.push(context, const OnBoardingScreen());
      } else {
        AppNavigation.push(context, const RootScreen());
      }
    } else {
      await Future.delayed(const Duration(seconds: 2));
      AppNavigation.push(context, const NetworkDisconnectScreen());
    }
  }
}

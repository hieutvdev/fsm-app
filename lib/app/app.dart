import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fsm_app/config/theme/app_theme.dart';
import 'package:fsm_app/features/splash/presentation/blocs/theme_cubit.dart';
import 'package:fsm_app/features/splash/presentation/screens/splash_screen.dart';

import '../config/router_config.dart';
import 'bloc_providers.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProvider,
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: "FSM App",
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            debugShowCheckedModeBanner: false,
            initialRoute: "/splash",
            routes: routeInit(context),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}

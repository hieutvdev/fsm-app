import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fsm_app/core/platform/network_info.dart';
import 'package:get_it/get_it.dart';
import 'package:fsm_app/common/helpers/navigation/app_navigation.dart';
import 'package:fsm_app/features/home/presentation/screens/home_screen.dart';

class NetworkDisconnectScreen extends StatefulWidget {
  const NetworkDisconnectScreen({super.key});

  @override
  State<NetworkDisconnectScreen> createState() =>
      _NetworkDisconnectScreenState();
}

class _NetworkDisconnectScreenState extends State<NetworkDisconnectScreen> {
  late NetworkInfo networkInfo;
  late StreamSubscription<bool> networkSubscription;

  @override
  void initState() {
    super.initState();
    networkInfo = GetIt.instance<NetworkInfo>();
    networkSubscription = networkInfo.onConnectivityChanged.listen((isConnected) {
      if (isConnected) {
        AppNavigation.pushReplacement(context, const HomeScreen());
      }
    });
  }

  @override
  void dispose() {
    networkSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("We can't connect to the internet"),
      ),
    );
  }
}
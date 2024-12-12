import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/navigation/app_navigation.dart';
import 'package:iconsax/iconsax.dart';

List<Widget> buildHomeScreenActions(BuildContext context) {
  return <Widget>[
    IconButton(
      icon: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: const Icon(
          Iconsax.notification,
          size: 20,
        ),
      ),
      onPressed: () {
        // Navigator.pushNamed(context, '/setting');
      },
    ),
    IconButton(
      icon: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: const Icon(
          Iconsax.search_normal_1,
          size: 20,
        ),
      ),
      onPressed: () {
        AppNavigation.pushNamed(context, '/search');
      },
    ),
    IconButton(
      icon: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: const Icon(
          Iconsax.message_2,
          size: 20,
        ),
      ),
      onPressed: () {
        // Navigator.pushNamed(context, '/setting');
      },
    )
  ];
}

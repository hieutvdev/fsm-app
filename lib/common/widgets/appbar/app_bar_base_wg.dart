import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/config/assets/app_images.dart';

class AppBarBaseWg extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool hideBack;
  final bool centerTitle;
  final bool isLogo;
  final IconData? leadingIcon;

  const AppBarBaseWg(
      {this.title,
      this.actions,
      this.backgroundColor,
      this.hideBack = false,
      this.centerTitle = true,
      this.isLogo = true,
      this.leadingIcon,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? (context.isDarkMode ? Colors.black : Colors.white),
      centerTitle: centerTitle,
      automaticallyImplyLeading: !hideBack,
      title: isLogo
          ? Image.asset(
              context.isDarkMode
                  ? AppImages.appLogoDark
                  : AppImages.appLogoLight,
              width: 50,
              height: 50,
            )
          : title,
      actions: actions ?? <Widget>[],
      leading: hideBack
          ? null
          : IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Container(
                height: 30,
                width: 30,
                padding: EdgeInsets.zero,
                child: Icon(
                  leadingIcon ?? Icons.arrow_back_ios_new,
                  size: 20,
                  color: context.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

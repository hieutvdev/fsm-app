import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';

import '../../../../config/theme/colors/app_colors.dart';

class ArticleBottomNavigationBarWidget extends StatelessWidget {
  const ArticleBottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      decoration: BoxDecoration(
          color: context.isDarkMode
              ? AppColors.darkBackground
              : AppColors.lightBackground,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, -1),
                blurRadius: 2,
                spreadRadius: 1)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Đọc thêm  ",
                  style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 12)),
              Container(
                width: 30,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: context.isDarkMode
                          ? AppColors.grey.withOpacity(0.5)
                          : AppColors.darkGrey.withOpacity(0.5),
                      width: 0.3),
                ),
                child: Text(
                  "+ 10",
                  style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 8),
                ),
              )
            ],
          ),
          InkWell(
            onTap: () {},
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: context.isDarkMode
                          ? AppColors.grey.withOpacity(0.5)
                          : AppColors.darkGrey.withOpacity(0.5),
                      width: 0.3)),
              child: Icon(
                Icons.close,
                size: 15,
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          Row(
            spacing: 12,
            children: [
              Icon(
                Icons.send_outlined,
                size: 20,
                color: context.isDarkMode ? Colors.white : Colors.black,
              ),
              Text("Gửi",
                  style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 12)),
              Icon(
                Icons.more_vert,
                size: 20,
                color: context.isDarkMode ? Colors.white : Colors.black,
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/features/article/data/models/aritcle_more_relate_model.dart';

import '../../../../config/theme/colors/app_colors.dart';

class ArticleMoreRelateWidget extends StatelessWidget {
  final ArticleMoreRelateModel articleMoreRelateModel;
  const ArticleMoreRelateWidget(
      {super.key, required this.articleMoreRelateModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      height: MediaQuery.of(context).size.height * 0.175,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(articleMoreRelateModel.mainImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            articleMoreRelateModel.title,
            style: TextStyle(
                color: context.isDarkMode
                    ? AppColors.grey
                    : AppColors.darkBackground,
                fontSize: 10),
            textAlign: TextAlign.justify,
            maxLines: 3,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/navigation/app_navigation.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/core/utils/date_item_utils.dart';
import 'package:fsm_app/features/article/data/models/article_item_list_model.dart';
import 'package:fsm_app/features/article/presentation/screens/article_details_screen.dart';
import 'package:fsm_app/features/article/presentation/widgets/article_list_more_relate_widget.dart';

import '../../../../config/theme/colors/app_colors.dart';

class ArticleItemWidget extends StatefulWidget {
  final bool isTopArticle;
  final ArticleItemListModel articleItemListModel;

  const ArticleItemWidget(
      {super.key,
      required this.articleItemListModel,
      this.isTopArticle = true});

  @override
  State<ArticleItemWidget> createState() => _ArticleItemWidgetState();
}

class _ArticleItemWidgetState extends State<ArticleItemWidget> {
  bool isMoreArticleRelate = false;

  void handleOpenArticleRelate() {
    setState(() {
      isMoreArticleRelate = !isMoreArticleRelate;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> categories =
        widget.articleItemListModel.categoryName.split('|||');

    return Container(
      width: double.infinity,
      padding: widget.isTopArticle
          ? EdgeInsets.zero
          : const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: context.isDarkMode
            ? AppColors.darkBackground
            : AppColors.lightBackground,
        border: Border.all(
            color: context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
            width: 0.5),
      ),
      child: InkWell(
        onTap: () {
          AppNavigation.push(
              context,
              ArticleDetailsScreen(
                  articleId: '${widget.articleItemListModel.id}'));
        },
        child: Column(
          children: [
            if (widget.isTopArticle == true) ...[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          widget.articleItemListModel.mainImageUrl),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    )),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  widget.articleItemListModel.title,
                  style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      margin: const EdgeInsets.only(right: 5),
                      child: Text(
                        categories.first.toString().toUpperCase(),
                        style: TextStyle(
                          fontSize: 9,
                          color: context.isDarkMode
                              ? AppColors.grey
                              : AppColors.darkGrey,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Text(
                        " -    ${formatPublishTime(widget.articleItemListModel.publishAt ?? DateTime.now())}",
                        style: TextStyle(
                          fontSize: 9,
                          color: context.isDarkMode
                              ? AppColors.grey
                              : AppColors.darkGrey,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  margin: const EdgeInsets.only(bottom: 10),
                  constraints: const BoxConstraints(
                    maxHeight: 130, // Set the maximum height here
                  ),
                  child: Text(
                    widget.articleItemListModel.description,
                    style: TextStyle(
                        fontSize: 12,
                        color: context.isDarkMode
                            ? AppColors.grey
                            : AppColors.darkGrey),
                    textAlign: TextAlign.justify,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  )),
            ] else ...[
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: Text(
                  widget.articleItemListModel.title,
                  style: TextStyle(
                      color: context.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                  textAlign: TextAlign.justify,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: 150, // Specify a height for the container
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              widget.articleItemListModel.mainImageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5),
                            bottomLeft: Radius.circular(5),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            padding: EdgeInsets.zero,
                            margin: const EdgeInsets.only(bottom: 10),
                            constraints: const BoxConstraints(
                              maxHeight: 130, // Set the maximum height here
                            ),
                            child: Text(
                              widget.articleItemListModel.description,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: context.isDarkMode
                                      ? AppColors.grey
                                      : AppColors.darkGrey),
                              textAlign: TextAlign.justify,
                              maxLines: 8,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              child: Text(
                                categories.first.toString().toUpperCase(),
                                style: TextStyle(
                                  fontSize: 9,
                                  color: context.isDarkMode
                                      ? AppColors.grey
                                      : AppColors.darkGrey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Text(
                                "- ${formatPublishTime(widget.articleItemListModel.publishAt ?? DateTime.now())}",
                                style: TextStyle(
                                  fontSize: 9,
                                  color: context.isDarkMode
                                      ? AppColors.grey
                                      : AppColors.darkGrey,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
            InkWell(
              onTap: handleOpenArticleRelate,
              child: Container(
                margin: EdgeInsets.only(
                    bottom: isMoreArticleRelate ? 5 : 20, top: 10),
                padding: widget.isTopArticle
                    ? const EdgeInsets.symmetric(horizontal: 10)
                    : EdgeInsets.zero,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Theo nhịp sống thị trường",
                      style: TextStyle(
                          fontSize: 12,
                          color: context.isDarkMode
                              ? AppColors.grey
                              : AppColors.darkGrey),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Text("Tin liên quan",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: context.isDarkMode
                                      ? AppColors.grey
                                      : AppColors.darkGrey)),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: Icon(
                            isMoreArticleRelate ? Icons.close : Icons.add,
                            key: ValueKey<bool>(isMoreArticleRelate),
                            size: 12,
                            color: context.isDarkMode
                                ? AppColors.grey
                                : AppColors.darkGrey,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            AnimatedCrossFade(
              firstChild: Container(),
              secondChild: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    alignment: Alignment.topLeft,
                    child: Text("Tin liên quan",
                        style: TextStyle(
                            fontSize: 12,
                            color: context.isDarkMode
                                ? AppColors.grey
                                : AppColors.darkGrey)),
                  ),
                  const ArticleListMoreRelateWidget(articleId: "1")
                ],
              ),
              crossFadeState: isMoreArticleRelate
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
            ),
          ],
        ),
      ),
    );
  }
}

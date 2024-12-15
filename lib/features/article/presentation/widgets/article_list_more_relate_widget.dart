import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';

import '../../../../config/theme/colors/app_colors.dart';
import '../../../../config/theme/colors/article/aricle_colors.dart';
import '../../data/models/aritcle_more_relate_model.dart';
import 'article_more_relate_widget.dart';

class ArticleListMoreRelateWidget extends StatefulWidget {
  final String articleId;
  const ArticleListMoreRelateWidget({super.key, required this.articleId});

  @override
  State<ArticleListMoreRelateWidget> createState() =>
      _ArticleListMoreRelateWidgetState();
}

class _ArticleListMoreRelateWidgetState
    extends State<ArticleListMoreRelateWidget> {
  late Future<void> _loadMoreFuture;

  @override
  void initState() {
    super.initState();
    _loadMoreFuture = _loadMore();
  }

  Future<void> _loadMore() async {
    await Future.delayed(const Duration(seconds: 10));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: _loadMoreFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.195,
            alignment: Alignment.center,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
            ),
            child: CircularProgressIndicator(
              color: context.isDarkMode ? Colors.white : Colors.black,
            ),
          );
        } else {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.195,
              alignment: Alignment.center,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: context.isDarkMode
                    ? ArticleColors.bgDarkColor
                    : ArticleColors.bgLightColor,
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 2 : 2,
                      right: index == 2 - 1 ? 2 : 2,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(
                        right: index == 5 - 1 ? 20 : 0,
                      ),
                      child: ArticleMoreRelateWidget(
                        articleMoreRelateModel: ArticleMoreRelateModel(
                          id: "1",
                          title:
                              "Theo PGS. TS Trần Đình Thiên, năm 2024, Việt Nam tiếp tục khẳng định vị thế trên bản đồ kinh tế thế giới khi dòng vốn FDI và kim ngạch xuất nhập khẩu tiếp tục tăng mạnh. Sự chuyển mình này mở ra triển vọng tươi sáng cho năm 2025, khi Việt Nam sẵn sàng bước vào kỷ nguyên vươn mình mới.",
                          mainImageUrl:
                              "https://images.pexels.com/photos/28943271/pexels-photo-28943271/free-photo-of-majestic-snow-capped-mountains-under-stormy-skies.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/features/advertisement/presentation/widgets/advertisement_item_widget.dart';
import 'package:fsm_app/features/article/data/models/article_details_model.dart';

import '../../../../core/utils/date_item_utils.dart';
import '../../../advertisement/data/models/advertisement_model.dart';
import '../widgets/article_bottom_navigation_bar_widget.dart';

class ArticleDetailsScreen extends StatefulWidget {
  final String articleId;
  const ArticleDetailsScreen({super.key, required this.articleId});

  @override
  State<ArticleDetailsScreen> createState() => _ArticleDetailsScreenState();
}

class _ArticleDetailsScreenState extends State<ArticleDetailsScreen> {
  late final Map<String, dynamic> articleJson = {
    'id': '123',
    'title':
        'Chiều 25.12, tiền vệ Nguyễn Hoàng Đức tham dự buổi họp báo trước trận bán kết lượt đi AFF Cup 2024 giữa đội tuyển Singapore và đội tuyển Việt Nam. Tại đây, anh tiết lộ điểm yếu của đối thủ.',
    'description':
        '''Tiền vệ của CLB Thể Công Viettel nói thêm về khó khăn của đội tuyển Việt Nam trên sân khách: "Chúng tôi đã có 2 buổi tập ở Singapore. Thời tiết mưa nhiều khiến chúng tôi gặp đôi chút khó khăn nhưng nhìn chung không có gì đáng ngại. Đội tuyển Việt Nam vẫn duy trì trạng thái hưng phấn. Trận đấu ngày mai (26.12) hứa hẹn sẽ rất hấp dẫn''',
    'mainImageUrl':
        'https://images.pexels.com/photos/6343453/pexels-photo-6343453.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load',
    'content': '''
      <p>Đây là nội dung bài viết. Nội dung này có thể rất dài và bao gồm nhiều phần:</p>
      <ul>
        <li>Phần 1: Giới thiệu</li>
        <li>Phần 2: Nội dung chính</li>
        <li>Phần 3: Kết luận</li>
      </ul>
      <p>Thêm các đoạn văn bản chi tiết, bao gồm hình ảnh:</p>
      <img src="https://images.pexels.com/photos/6343453/pexels-photo-6343453.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load" alt="Hình minh họa" />
      <p>Cuối cùng, có thể thêm các liên kết và tài liệu tham khảo:</p>
      <a href="https://flutter.dev">Tìm hiểu thêm về Flutter</a>
    ''',
    'slug': 'bai-viet-mau',
    'publishAt': '2024-12-16T10:00:00Z',
    'tags': 'Flutter, HTML',
    'categoryName': 'Công nghệ',
    'authorId': 'author_01',
  };

  final List<int> _fontSize = [14, 16, 18, 20, 22];
  late final int _currentFontSizeIndex = _fontSize.indexOf(16);

  late final ArticleDetailsModel article =
      ArticleDetailsModel.fromJson(articleJson);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        toolbarHeight: 20,
      ),
      body: SingleChildScrollView(
        child: Column(
          spacing: 12,
          children: [
            AdvertisementItemWidget(
              advertisement: AdvertisementModel(
                id: "1",
                url: "https://unsplash.com/t/spirituality",
                imageUrl:
                    "https://images.pexels.com/photos/6343453/pexels-photo-6343453.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
                domainUrl: "https://www.google.com",
              ),
              onClose: () {},
              isOnlyImage: true,
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(article.mainImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Text(article.categoryName.toUpperCase(),
                        style: TextStyle(
                            color: context.isDarkMode
                                ? Colors.white
                                : Colors.deepPurple,
                            fontWeight: FontWeight.w500,
                            fontSize: 12)),
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 15,
                        color: context.isDarkMode ? Colors.white : Colors.black,
                      ),
                      Text(
                          formatPublishTime(
                              DateTime.parse(article.publishAt ?? '')),
                          style: TextStyle(
                              color: context.isDarkMode
                                  ? Colors.white
                                  : Colors.black,
                              fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                article.title,
                style: TextStyle(
                    color: context.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.justify,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft,
              child: Text(
                article.description,
                style: TextStyle(
                  color: context.isDarkMode
                      ? Colors.white
                      : Colors.black.withOpacity(0.5),
                  fontSize: 12,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            Html(data: article.content),
          ],
        ),
      ),
      bottomNavigationBar: const ArticleBottomNavigationBarWidget(),
    );
  }
}

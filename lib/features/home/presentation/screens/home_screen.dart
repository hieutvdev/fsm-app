import 'package:flutter/material.dart';
import 'package:fsm_app/common/widgets/appbar/app_bar_base_wg.dart';
import 'package:fsm_app/features/advertisement/presentation/widgets/advertisement_item_widget.dart';
import 'package:fsm_app/features/article/data/models/article_item_list_model.dart';
import 'package:fsm_app/features/article/presentation/widgets/article_item_widget.dart';
import 'package:fsm_app/features/home/presentation/widgets/home_screen_actions.dart';
import 'package:fsm_app/features/stock/presentation/widgets/stock_list_widget.dart';

import '../../../advertisement/data/models/advertisement_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<dynamic> items = [
    AdvertisementModel(
        id: "1",
        url: "https://unsplash.com/t/spirituality",
        imageUrl:
            "https://images.pexels.com/photos/6343453/pexels-photo-6343453.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        domainUrl: "https://www.google.com"),
    const Text("Dino baby"),
    AdvertisementModel(
        id: "2",
        url: "https://unsplash.com/t/spirituality",
        imageUrl:
            "https://images.pexels.com/photos/28943271/pexels-photo-28943271/free-photo-of-majestic-snow-capped-mountains-under-stormy-skies.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        domainUrl: "https://www.example.com"),
    const StockListWidget(),
    ArticleItemWidget(
        articleItemListModel: ArticleItemListModel(
            id: "1",
            title:
                "Bộ chính trị cảnh cáo ông Nguyễn Xuân Phúc, Trường Hòa Đình, khiển trách bà trương thị mai",
            description:
                "Ngày 13/12/2024, tải trụ sở trung ương đảng, bộ chính trị đã xem xét thi hành kỉ luật đảng viên có vi phạm ",
            mainImageUrl:
                "https://images.pexels.com/photos/28943271/pexels-photo-28943271/free-photo-of-majestic-snow-capped-mountains-under-stormy-skies.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
            slug: "HI",
            tags: "Tài chính ||| Ngân hàng",
            categoryName: "Đời sống"))
  ];

  Future<void> _refreshItems() async {
    // Simulate network request
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      // Update the items list here
    });
  }

  void _removeAdvertisement(String id) {
    setState(() {
      items.removeWhere((item) => item is AdvertisementModel && item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final actions = buildHomeScreenActions(context);
    return Scaffold(
      appBar: AppBarBaseWg(
        actions: actions,
        hideBack: true,
        isLogo: false,
        title: const Text(
          "fsm",
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: false,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: RefreshIndicator(
          onRefresh: _refreshItems,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              if (item is AdvertisementModel) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: AdvertisementItemWidget(
                    key: ValueKey(item.id),
                    advertisement: item,
                    isOnlyImage: '1' == item.id ? true : false,
                    onClose: () => _removeAdvertisement(item.id),
                  ),
                );
              } else if (item is Text) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: item,
                );
              } else if (item is StockListWidget) {
                return const StockListWidget();
              }
              if (item is ArticleItemWidget) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: item,
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

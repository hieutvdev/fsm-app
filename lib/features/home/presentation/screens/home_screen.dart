import 'package:flutter/material.dart';
import 'package:fsm_app/common/widgets/appbar/app_bar_base_wg.dart';
import 'package:fsm_app/features/advertisement/presentation/widgets/advertisement_item_widget.dart';
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
        url: "https://www.google.com",
        imageUrl:
            "https://images.pexels.com/photos/6343453/pexels-photo-6343453.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load",
        domainUrl: "https://www.google.com"),
    const Text("Hello World"),
    AdvertisementModel(
        id: "2",
        url: "https://www.example.com",
        imageUrl:
            "https://images.pexels.com/photos/28943271/pexels-photo-28943271/free-photo-of-majestic-snow-capped-mountains-under-stormy-skies.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        domainUrl: "https://www.example.com"),
    const StockListWidget()
  ];

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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: items.isNotEmpty
                  ? items.map((item) {
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
                      return Container();
                    }).toList()
                  : const [Text("No items")],
            ),
          ),
        ));
  }
}

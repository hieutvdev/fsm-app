import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/features/stock/presentation/widgets/stock_item_widget.dart';

import '../../../../config/theme/colors/app_colors.dart';
import '../../data/models/stock_list_item_model.dart';

class StockListWidget extends StatefulWidget {
  const StockListWidget({super.key});

  @override
  State<StockListWidget> createState() => _StockListWidgetState();
}

class _StockListWidgetState extends State<StockListWidget> {
  final items = [
    StockListItemModel(
        code: "VNINDEX",
        price: 1.267,
        change: -1.5,
        changePercent: -0.12,
        total: 13492.33),
    StockListItemModel(
        code: "VN30",
        price: 1.335,
        change: -0.93,
        changePercent: -0.07,
        total: 5858.48),
    StockListItemModel(
        code: "HNX30",
        price: 112412.3,
        change: 1.5,
        changePercent: 0.22,
        total: 124124.33),
    StockListItemModel(
        code: "HNX",
        price: 1.267,
        change: -1.5,
        changePercent: -0.12,
        total: 13492.33),
    StockListItemModel(
        code: "UPCOM",
        price: 1.267,
        change: -1.5,
        changePercent: -0.12,
        total: 13492.33),
  ];

  final ScrollController _scrollController = ScrollController();
  bool _showArrow = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= 0) {
        setState(() {
          _showArrow = true;
        });
      } else {
        setState(() {
          _showArrow = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.125,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              color: context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
            ),
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(
                    left: index == 0 ? 5 : 5,
                    right: index == items.length - 1 ? 20 : 5,
                  ),
                  child: Container(
                      margin: EdgeInsets.only(
                          right: index == items.length - 1 ? 20 : 0),
                      child: StockItemWidget(stockListItemModel: items[index])),
                );
              },
            ),
          ),
        ),
        if (_showArrow)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.135 / 2 - 15,
            right: 5,
            child: Container(
              width: 30,
              height: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color:
                      context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey)),
              child: Icon(
                Icons.arrow_forward,
                color: context.isDarkMode ? AppColors.grey : AppColors.darkGrey,
                size: 15,
              ),
            ),
          ),
      ],
    );
  }
}

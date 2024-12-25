import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/features/stock/data/models/stock_list_item_model.dart';

import '../../../../config/theme/colors/app_colors.dart';

class StockItemWidget extends StatefulWidget {
  final StockListItemModel stockListItemModel;

  const StockItemWidget({super.key, required this.stockListItemModel});

  @override
  State<StockItemWidget> createState() => _StockItemWidgetState();
}

class _StockItemWidgetState extends State<StockItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.375,
      height: MediaQuery.of(context).size.height * 0.08,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: context.isDarkMode
                ? AppColors.grey.withOpacity(0.5)
                : AppColors.darkGrey.withOpacity(0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.stockListItemModel.code,
            style: TextStyle(
              fontSize: 12,
              color: context.isDarkMode ? AppColors.grey : AppColors.darkGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(widget.stockListItemModel.price.toString(),
                  style: TextStyle(
                    fontSize: 8,
                    color: context.isDarkMode
                        ? AppColors.grey
                        : AppColors.darkGrey,
                  )),
              if (widget.stockListItemModel.change > 0)
                const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,
                )
              else
                const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,
                ),
              Text(widget.stockListItemModel.change.toString(),
                  style: TextStyle(
                    fontSize: 8,
                    color: widget.stockListItemModel.changePercent > 0
                        ? Colors.green
                        : Colors.red,
                  )),
              Text(' (${widget.stockListItemModel.changePercent.toString()}%)',
                  style: TextStyle(
                    fontSize: 8,
                    color: widget.stockListItemModel.changePercent > 0
                        ? Colors.green
                        : Colors.red,
                  )),
            ],
          ),
          Text("GTGD: ${widget.stockListItemModel.total.toString()} tỷ",
              style: TextStyle(
                fontSize: 8,
                color: context.isDarkMode ? AppColors.grey : AppColors.darkGrey,
              )),
        ],
      ),
    );
  }
}

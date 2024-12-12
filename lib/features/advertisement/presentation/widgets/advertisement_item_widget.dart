import 'package:flutter/material.dart';
import 'package:fsm_app/common/helpers/theme_mode/is_dark_mode.dart';
import 'package:fsm_app/config/theme/colors/app_colors.dart';
import 'package:fsm_app/features/advertisement/data/models/advertisement_model.dart';

class AdvertisementItemWidget extends StatefulWidget {
  final bool? isOnlyImage;
  final AdvertisementModel advertisement;
  final VoidCallback onClose;

  const AdvertisementItemWidget(
      {super.key,
      required this.advertisement,
      this.isOnlyImage = false,
      required this.onClose});

  @override
  State<AdvertisementItemWidget> createState() =>
      _AdvertisementItemWidgetState();
}

class _AdvertisementItemWidgetState extends State<AdvertisementItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
              width: double.infinity,
              height: widget.isOnlyImage == false
                  ? MediaQuery.of(context).size.height * 0.3
                  : MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: context.isDarkMode ? AppColors.darkGrey : AppColors.grey,
              )),
        ),
        Positioned(
          child: Container(
              width: double.infinity,
              height: widget.isOnlyImage == true
                  ? MediaQuery.of(context).size.height * 0.25
                  : MediaQuery.of(context).size.height * 0.22,
              decoration: BoxDecoration(
                borderRadius: widget.isOnlyImage == true
                    ? BorderRadius.circular(5)
                    : const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        topRight: Radius.circular(5)),
                image: DecorationImage(
                    image: NetworkImage(widget.advertisement.imageUrl),
                    fit: BoxFit.cover),
              )),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 40,
              height: 20,
              alignment: const Alignment(0.5, 1),
              decoration: BoxDecoration(
                  color: context.isDarkMode
                      ? AppColors.darkGrey.withOpacity(0.8)
                      : AppColors.grey.withOpacity(0.8),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomLeft: Radius.circular(30),
                  )),
              padding: EdgeInsets.zero,
              child: InkWell(
                onTap: widget.onClose,
                child: Icon(Icons.close,
                    color: context.isDarkMode
                        ? AppColors.grey
                        : AppColors.darkGrey,
                    size: 20),
              ),
            )),
        if (widget.isOnlyImage == true)
          Container()
        else
          Positioned(
              bottom: MediaQuery.of(context).size.height * 0.01,
              left: 10,
              child: Container(
                padding: EdgeInsets.zero,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Learn more",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.advertisement.url,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 5),
                        const Icon(Icons.add_chart, size: 12)
                      ],
                    )
                  ],
                ),
              ))
      ],
    );
  }
}

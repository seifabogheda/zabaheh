import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class OrderDetailsInfoItem extends StatelessWidget {
  final String title;
  final String value;
  final bool neeWhiteColor;
  final bool? needGreenColor;

  const OrderDetailsInfoItem(
      {Key? key,
      required this.title,
      required this.value,
      required this.neeWhiteColor,
      this.needGreenColor = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      color: neeWhiteColor ? ColorManager.white : ColorManager.offWhite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            title: title,
            color:
                needGreenColor == true ? ColorManager.green : ColorManager.grey,
            size: 13,
          ),
          Spacer(),
          MyText(
            title: value,
            color: needGreenColor == true
                ? ColorManager.green
                : ColorManager.grey2,
            size: 12,
          ),
        ],
      ),
    );
  }
}



import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class CartSummaryItem extends StatelessWidget {
  final bool? changeToGreenBackground;
  final String title;
  final String value;
  const CartSummaryItem({Key? key, this.changeToGreenBackground, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      color:changeToGreenBackground == true? ColorManager.selectedPaymentColor : ColorManager.white ,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyText(
            title: title,
            color:
            changeToGreenBackground == true ? ColorManager.black : ColorManager.grey,
            size: 13,
          ),
          Spacer(),
          MyText(
            title: value,
            color: changeToGreenBackground == true
                ? ColorManager.green
                : ColorManager.grey2,
            size: 12,
          ),
        ],
      ),
    );
  }
}

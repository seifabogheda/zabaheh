import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resource/color_manager.dart';

class CartCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: context.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.selectedPaymentColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(AssetsManager.coupon,height: 25,),
          SizedBox(width: 10,),
          MyText(title: "أضف كوبون الخصم",size: 12,color: ColorManager.grey,),
          Spacer(),
          CustomButton(title: "تفعيل",onTap: (){},width: 100,color: ColorManager.green,),
        ],
      ),
    );
  }
}

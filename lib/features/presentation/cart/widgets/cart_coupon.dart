import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resource/color_manager.dart';

class CartCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: context.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.selectedPaymentColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsManager.coupon,
            height: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: CustomTextField(
            validator: (value) => value?.noValidate(),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            hint: "أضف كوبون الخصم",
          )),

          CustomButton(
            title: "تفعيل",
            onTap: () {},
            width: 80,
            height: 35,
            color: ColorManager.green,
          ),
        ],
      ),
    );
  }
}

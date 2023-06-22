import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/features/presentation/cart/widgets/cart_payment_way.dart';
import 'package:flutter/material.dart';

import 'cart_coupon.dart';
import 'cart_details.dart';
import 'cart_receive_order.dart';
import 'cart_summary.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CartDetails(),
        CartPaymentWay(),
        CartReceiveOrder(),
        CartCoupon(),
        CartSummary(),
        CustomButton(
          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          title: "تاكيد الطلب",
          onTap: () {},
          width: context.width * 0.8,
          borderRadius: BorderRadius.circular(10),
        ),
      ],
    );
  }
}



import 'package:base_flutter/features/presentation/cart/widgets/cart_payment_way.dart';
import 'package:flutter/material.dart';

import 'cart_coupon.dart';
import 'cart_details.dart';
import 'cart_receive_order.dart';

class CartBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        CartDetails(),
        CartPaymentWay(),
        CartReceiveOrder(),
        CartCoupon(),
      ],
    );
  }
}

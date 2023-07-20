import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/features/presentation/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';
import 'cart_summary_item.dart';

class CartSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return Container(
      height: context.height * 0.346,
      width: context.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: MyText(
              title: "ملخص الطلب: ",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          Divider(),
          CartSummaryItem(
            title: 'قيمة الطلب',
            value: '${cubit.state.productPrice} رس',
          ),
          CartSummaryItem(
            title: 'سعر التوصيل',
            value: '${cubit.selectedCity?.shippingCost ?? 0} رس',
          ),
          CartSummaryItem(
            title: 'قيمة الخصم',
            value: '${cubit.coupon ?? 0} رس',
          ),
          CartSummaryItem(
            title: 'القيمة المضافة',
            value: '15%',
          ),
          CartSummaryItem(
            title: 'الاجمالى',
            value: '${cubit.state.cartPrice} رس',
            changeToGreenBackground: true,
          ),
        ],
      ),
    );
  }
}

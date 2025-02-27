import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import 'cart_summary_item.dart';

class CartSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return Container(
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
              title: "${tr(context, "orderSummary")}: ",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          Divider(),
          CartSummaryItem(
            title: tr(context, "orderPrice"),
            value: '${cubit.state.cartPrice} ${tr(context,"sr")}',
          ),
          CartSummaryItem(
            title: tr(context, "deliveryPrice"),
            value: '${cubit.deliveryPrice} ${tr(context,"sr")}',
          ),
          CartSummaryItem(
            title: tr(context, "discount"),
            value: '${cubit.coupon?.discountAmount ?? 0} ${tr(context,"sr")}',
          ),
          CartSummaryItem(
            title: tr(context, "totalAdd"),
            value: '15%',
          ),
          CartSummaryItem(
            title: tr(context, "total"),
            value: '${cubit.state.cartPriceAfterCoupon} ${tr(context,"sr")}',
            changeToGreenBackground: true,
          ),
        ],
      ),
    );
  }
}

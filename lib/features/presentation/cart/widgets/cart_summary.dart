import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
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
              title: "${tr(context, "orderSummary")}: ",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          Divider(),
          CartSummaryItem(
            title: tr(context, "orderPrice"),
            value: '${cubit.state.productPrice} ${tr(context,"sr")}',
          ),
          CartSummaryItem(
            title: tr(context, "deliveryPrice"),
            value: '${cubit.selectedCity?.shippingCost ?? 0} ${tr(context,"sr")}',
          ),
          CartSummaryItem(
            title: tr(context, "discount"),
            value: '${cubit.coupon ?? 0} ${tr(context,"sr")}',
          ),
          CartSummaryItem(
            title: tr(context, "totalAdd"),
            value: '15%',
          ),
          CartSummaryItem(
            title: tr(context, "total"),
            value: '${cubit.state.cartPrice} ${tr(context,"sr")}',
            changeToGreenBackground: true,
          ),
        ],
      ),
    );
  }
}

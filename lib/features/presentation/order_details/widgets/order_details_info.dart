import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../models/order_details_model.dart';
import 'order_details_info_item.dart';

class OrderDetailsInfo extends StatelessWidget {
  final OrderDetailsModel? model;

  const OrderDetailsInfo({Key? key, this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
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
              title: "${tr(context, "orderDetails")}: ",
              color: ColorManager.green,
              size: 14,
            ),
          ),
          Divider(),
          OrderDetailsInfoItem(
            title: tr(context, "orderNum"),
            value: '#${model?.id ?? 0}',
            neeWhiteColor: true,
          ),
          OrderDetailsInfoItem(
            title: tr(context, "reservationDate"),
            value: '${model?.orderDate ?? 0}',
            neeWhiteColor: false,
          ),
          OrderDetailsInfoItem(
            title: tr(context, "paymentWay"),
            value: 'كاش',
            neeWhiteColor: false,
          ),
          OrderDetailsInfoItem(
            title: tr(context, "deliveryDestination"),
            value: '${model?.shippingAddress ?? ''}',
            neeWhiteColor: true,
          ),
          OrderDetailsInfoItem(
            title: tr(context, "total"),
            value: '${model?.totalPrice ?? 0} ${tr(context, "sr")}',
            neeWhiteColor: false,
            needGreenColor: true,
          ),
        ],
      ),
    );
  }
}

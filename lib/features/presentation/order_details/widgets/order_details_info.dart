import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../models/order_details_model.dart';
import 'order_details_info_item.dart';

class OrderDetailsInfo extends StatelessWidget {
  final OrderDetailsModel? model;

  const OrderDetailsInfo({Key? key,  this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.62,
      width: context.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
          OrderDetailsInfoItem(title: tr(context, "orderNum"), value: '#${model?.orderNumber ?? 0}', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: tr(context, "reservationDate"), value: '${model?.deliveryDate ?? 0}', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: tr(context, "deliveryOrderTime"), value: '${model?.deliveryTime?.from} : ${model?.deliveryTime?.to}', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: tr(context, "paymentWay"), value: 'كاش', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: tr(context, "deliveryDestination"), value: '${model?.location?.address ?? ''}', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: tr(context, "orderPrice"), value: '${model?.subtotal ?? 0} ${tr(context,"sr")}', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: tr(context, "deliveryPrice"), value: '${model?.shippingCost} ${tr(context,"sr")}', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: tr(context, "discount"), value: '${model?.couponDiscount} ${tr(context,"sr")}', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: tr(context, "totalAdd"), value: '${model?.valueAdded ?? 0} %', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: tr(context, "total"), value: '${model?.total ?? 0} ${tr(context,"sr")}', neeWhiteColor: false,needGreenColor: true,),
        ],
      ),
    );
  }
}

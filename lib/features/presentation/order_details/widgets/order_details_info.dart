import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

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
              title: "بيانات الطلب: ",
              color: ColorManager.green,
              size: 14,
            ),
          ),
          Divider(),
          OrderDetailsInfoItem(title: 'رقم الطلب', value: '#${model?.orderNumber ?? 0}', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'تاريخ التوصيل', value: '${model?.deliveryDate ?? 0}', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: 'وقت التوصيل', value: '${model?.deliveryTime?.from} : ${model?.deliveryTime?.to}', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'طريقة الدفع', value: 'كاش', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: 'عنوان التوصيل', value: '${model?.location?.address ?? ''}', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'قيمة الطلب', value: '${model?.subtotal ?? 0} رس', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: 'قيمة التوصيل', value: '${model?.shippingCost} رس', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'قيمة الخصم', value: '${model?.couponDiscount} رس', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: 'القيمة المضافة', value: '${model?.valueAdded ?? 0} %', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'المجموع الكلي', value: '${model?.total ?? 0} رس', neeWhiteColor: false,needGreenColor: true,),
        ],
      ),
    );
  }
}

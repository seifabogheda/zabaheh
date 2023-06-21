import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import 'order_details_info_item.dart';

class OrderDetailsInfo extends StatelessWidget {
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
          OrderDetailsInfoItem(title: 'رقم الطلب', value: '#1907', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'تاريخ التوصيل', value: '02/01/2023', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: 'وقت التوصيل', value: '2 ساعة', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'طريقة الدفع', value: 'كاش', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: 'عنوان التوصيل', value: 'الرياض', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'قيمة الطلب', value: '50 رس', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: 'قيمة التوصيل', value: '10 رس', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'قيمة الخصم', value: '40 رس', neeWhiteColor: false,),
          OrderDetailsInfoItem(title: 'القيمة المضافة', value: '00 رس', neeWhiteColor: true,),
          OrderDetailsInfoItem(title: 'المجموع الكلي', value: '50 رس', neeWhiteColor: false,needGreenColor: true,),
        ],
      ),
    );
  }
}

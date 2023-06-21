

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class OrderDetailsNotices extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.2,
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
              title: "ملاحظات",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          Divider(),
          MyText(
            title: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق",
            color: ColorManager.black,
            size: 14,
            fontWeight: FontWeight.normal ,
          ),
        ],
      ),
    );
  }
}

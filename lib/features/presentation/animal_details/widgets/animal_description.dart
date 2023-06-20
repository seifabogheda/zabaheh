
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class AnimalDescription extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      color: ColorManager.white,
      child: Column(
        children: [
          MyText(title: "نعيمي بلدي",color: ColorManager.green,size: 16,),
          SizedBox(height: 10,),
          MyText(title: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق",color: ColorManager.grey2,size: 12,
          fontWeight: FontWeight.normal,),
        ],
      ),
    );
  }
}

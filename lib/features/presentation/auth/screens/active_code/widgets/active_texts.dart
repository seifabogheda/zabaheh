import 'package:flutter/material.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/resource/color_manager.dart';

class ActiveTexts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 7,),
        MyText(title: "كود التفعيل",size: 22,fontWeight: FontWeight.bold,color: ColorManager.black,),
        SizedBox(height: 7,),
        MyText(title: "برجاء ادخال كود التفعيل المرسل إليك عبر الجوال",size: 14,fontWeight: FontWeight.normal,color: ColorManager.grey2,),
        SizedBox(height: 25,),      ],
    );
  }
}

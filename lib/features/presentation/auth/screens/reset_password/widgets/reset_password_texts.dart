


import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/resource/color_manager.dart';


class ResetPasswordTexts extends StatelessWidget {
  const ResetPasswordTexts();

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        // SizedBox(height: context.height*0.1,),
        MyText(title: "استعد حسابك",size: 22,fontWeight: FontWeight.bold,color: ColorManager.black,),
        SizedBox(height: 7,),
        MyText(title: "برجاء ملئ البيانات و انشاء كلمة مرور جديدة",size: 14,fontWeight: FontWeight.normal,color: ColorManager.grey2,),
        SizedBox(height: 35,),      ],
    );
  }
}

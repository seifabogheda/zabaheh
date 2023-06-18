

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resource/color_manager.dart';

class ForgetPasswordTexts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: context.height*0.1,),
        MyText(title: "نسيت كلمة المرور؟",size: 22,fontWeight: FontWeight.bold,color: ColorManager.black,),
        SizedBox(height: 7,),
        MyText(title: "برجاء كتابة رقم الهاتف لارسال كود التحقق",size: 14,fontWeight: FontWeight.normal,color: ColorManager.grey2,),
        SizedBox(height: 35,),      ],
    );
  }
}


import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';


class RegisterTexts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height*0.1,),
        MyText(title: "إستكمال بياناتك",size: 22,fontWeight: FontWeight.bold,color: ColorManager.black,),
        SizedBox(height: 7,),
        MyText(title: "برجاء تعبئة البيانات التالية لاستكمال ملفك الشخصى",size: 14,fontWeight: FontWeight.normal,color: ColorManager.grey2,),
        SizedBox(height: 35,),

      ],
    );
  }
}

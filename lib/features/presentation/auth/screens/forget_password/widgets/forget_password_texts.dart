

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resource/color_manager.dart';

class ForgetPasswordTexts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: context.height*0.1,),
        MyText(title: tr(context, "forgetPassword"),size: 22,fontWeight: FontWeight.bold,color: ColorManager.black,),
        SizedBox(height: 5,),
        MyText(title: tr(context, "insertPhoneForForget"),size: 14,fontWeight: FontWeight.normal,color: ColorManager.grey2,),
        SizedBox(height: 25,),
      ],
    );
  }
}

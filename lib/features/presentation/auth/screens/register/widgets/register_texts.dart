
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';


class RegisterTexts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height*0.1,),
        MyText(title: tr(context, "completeData"),size: 22,fontWeight: FontWeight.bold,color: ColorManager.black,),
        SizedBox(height: 7,),
        MyText(title: tr(context, "fillInfoRegister"),size: 12,fontWeight: FontWeight.normal,color: ColorManager.grey2,
        alien: TextAlign.center,),
        SizedBox(height: 35,),

      ],
    );
  }
}

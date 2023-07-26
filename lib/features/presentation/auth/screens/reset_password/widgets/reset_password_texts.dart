import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';

class ResetPasswordTexts extends StatelessWidget {
  const ResetPasswordTexts();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: context.height*0.1,),
        MyText(
          title: tr(context, "getAccBack"),
          size: 22,
          fontWeight: FontWeight.bold,
          color: ColorManager.black,
        ),
        SizedBox(
          height: 7,
        ),
        MyText(
          title: tr(context, "fillData"),
          size: 14,
          fontWeight: FontWeight.normal,
          color: ColorManager.grey2,
        ),
        SizedBox(
          height: 35,
        ),
      ],
    );
  }
}

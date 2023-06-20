

import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_button.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(title: 'حفظ التغييرات',onTap: (){},),
        CustomTextButton(title: 'تغيير كلمة المرور', onTap: () {  },color: ColorManager.black,)
      ],
    );
  }
}

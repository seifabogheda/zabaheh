

import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_button.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../../more/screens/change_password/change_password_view.dart';

class ProfileButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(title: 'حفظ التغييرات',onTap: (){},),
        CustomTextButton(title: 'تغيير كلمة المرور', onTap: () {
          NavigationService.navigateTo(ChangePasswordView());
        },color: ColorManager.black,)
      ],
    );
  }
}

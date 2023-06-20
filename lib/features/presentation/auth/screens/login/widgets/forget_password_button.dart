import 'package:base_flutter/core/base_widgets/custom_text_button.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../forget_password/forget_password_view.dart';


class ForgetPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      title: tr('forgetPassword'),
      onTap: () {
        NavigationService.navigateTo(ForgetPasswordView());
      },
      alignment: Alignment.topLeft,
    );
  }
}

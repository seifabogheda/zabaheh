import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/auth/screens/forget_password/widgets/forget_password_body.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView();

  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
        title: "استرجاع كلمة المرور",
        needBack: true,
        child: ForgetPasswordBody());
  }
}

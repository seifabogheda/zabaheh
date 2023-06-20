import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/widgets/reset_password_body.dart';
import 'package:flutter/material.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView();

  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
        title: "استعادة كلمة المرور",
        needBack: true,
        child: ResetPasswordBody());
  }
}

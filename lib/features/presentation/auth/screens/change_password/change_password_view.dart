import 'package:base_flutter/features/presentation/more/screens/change_password/widgets/change_password_body.dart';
import 'package:base_flutter/features/presentation/more/widgets/more_scaffold.dart';
import 'package:flutter/material.dart';

class ChangePasswordView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: "تغيير كلمة المرور",
      body: ChangePasswordBody(),
    );
  }
}

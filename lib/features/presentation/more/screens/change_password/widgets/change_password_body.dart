

import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

import 'change_password_form.dart';

class ChangePasswordBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ChangePasswordForm(),
          CustomButton(title: tr(context,"confirm"),onTap: (){},),
        ],
      ),
    );
  }
}

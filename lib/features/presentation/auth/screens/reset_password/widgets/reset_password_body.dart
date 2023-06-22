import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';

import 'package:base_flutter/features/custom_widgets/logo_widget.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/widgets/reset_password_form.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/widgets/reset_password_texts.dart';
import 'package:flutter/material.dart';

import '../../login/login_view.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LogoWidget(),
              ResetPasswordTexts(),
              ResetPasswordForm(),
              CustomButton(
                title: tr(context,"confirm"),
                onTap: () {
                  NavigationService.removeUntil(LoginView());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

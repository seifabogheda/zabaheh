
import 'package:base_flutter/features/presentation/auth/screens/register/widgets/register_body.dart';
import 'package:flutter/material.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/resource/color_manager.dart';
import '../../../../custom_widgets/auth_custom_appbar.dart';



class RegisterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
      scaffoldColor: ColorManager.offWhite,
      title: tr(context,'register'),
      needBack: true,
      child: Expanded(
        child: RegisterBody(),
      ),
    );
  }
}

import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/widgets/register_form.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/widgets/register_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/base_widgets/custom_button.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../active_code/active_view.dart';

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: SingleChildScrollView(
        child: Column(
          children: [
            RegisterTexts(),
            RegisterForm(),
            CustomButton(
              title: tr(context,'confirm'),
              onTap: () {
                NavigationService.navigateTo(ActiveView());
              },
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            ),
            SvgPicture.asset(AssetsManager.undraw_good),
          ],
        ),
      ),
    );
  }
}

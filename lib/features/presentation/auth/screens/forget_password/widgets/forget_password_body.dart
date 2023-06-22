import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/custom_widgets/logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/assets_manager.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../../core/resource/value_manager.dart';
import '../../reset_password/reset_password_view.dart';
import 'forget_password_texts.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          LogoWidget(),
          ForgetPasswordTexts(),
          Form(
            child: CustomTextField(
              upperText: tr(context,"phone"),
              validator: (value) => value?.validatePhone(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.phone,
              hint: tr(context,'phone'),
              prefixIcon: Icon(
                Icons.phone_android_sharp,
                color: ColorManager.primary,
              ),
              suffixIcon: Container(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: AppPadding.p8),
                      child: MyText(
                        title: "|",
                        size: 20,
                        color: ColorManager.grey2,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    SvgPicture.asset(AssetsManager.saudi),
                    Padding(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: MyText(
                        title: "+966",
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.grey2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(),
          CustomButton(
            margin: EdgeInsets.only(bottom: 30),
            title: tr(context,"send"),
            width: context.width*0.8,
            onTap: () {
              NavigationService.navigateTo(ResetPasswordView());
            },
          ),
        ],
      ),
    );
  }
}

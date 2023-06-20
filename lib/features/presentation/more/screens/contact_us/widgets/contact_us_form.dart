import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:base_flutter/core/helpers/validator.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/assets_manager.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../../core/resource/value_manager.dart';



class ContactUsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            validator: (value) => value?.validateEmpty(context),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            upperText: "الاسم",
            hint: "رجاء ادخال الاسم",
          ),
          CustomTextField(
            upperText: tr("phone"),
            validator: (value) => value?.validatePhone(context),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.phone,
            hint: tr('phone'),
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
          CustomTextField(
            validator: (value) => value?.validateEmpty(context),
            fieldTypes: FieldTypes.rich,
            type: TextInputType.text,
            upperText: "الرسالة",
            hint: "برجاء كتابة الرساله",
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

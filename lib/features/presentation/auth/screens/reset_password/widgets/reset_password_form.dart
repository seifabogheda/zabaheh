import 'package:base_flutter/core/helpers/validator.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/resource/color_manager.dart';



class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm();

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.phone,
          upperText: "كود التحقق",
          hint: "الرجاء ادخال الكود",
        ),
        CustomTextField(
          validator: (value) => value?.validatePassword(context),
          fieldTypes: FieldTypes.password,
          type: TextInputType.text,
          upperText: "كلمة المرور",
          hint: "الرجاء ادخال كلمة المرور",
          prefixIcon: Icon(
            Icons.lock,
            color: ColorManager.primary,
          ),
        ),
        CustomTextField(
          //todo change validate to confirm validate
          validator: (value) => value?.validatePassword(context),
          fieldTypes: FieldTypes.password,
          type: TextInputType.text,
          upperText: "تأكيد كلمة المرور",
          hint: "الرجاء ادخال تأكيد كلمة المرور",
          prefixIcon: Icon(
            Icons.lock,
            color: ColorManager.primary,
          ),
        ),
      ],
    ));
  }
}

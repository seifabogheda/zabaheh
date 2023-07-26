import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../auth/blocs/change_password_cubit/change_password_cubit.dart';

class ChangePasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ChangePasswordCubit.get(context);
    return Form(
      key: cubit.changePasswordFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: cubit.oldPassController,
            validator: (value) => value?.validatePassword(context),
            fieldTypes: FieldTypes.password,
            type: TextInputType.text,
            hint: tr(context, "oldPassword"),
          ),
          CustomTextField(
            controller: cubit.newPassController,
            validator: (value) => value?.validatePassword(context),
            fieldTypes: FieldTypes.password,
            type: TextInputType.text,
            hint: tr(context, "newPassword"),
          ),
          CustomTextField(
            validator: (value) => value?.validatePasswordConfirm(context, pass:cubit.newPassController.text),
            fieldTypes: FieldTypes.password,
            type: TextInputType.text,
            controller: cubit.confirmNewPassController,
            hint: tr(context, "confirmPass"),
          ),
        ],
      ),
    );
  }
}

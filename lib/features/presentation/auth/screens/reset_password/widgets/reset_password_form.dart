import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../blocs/reset_password_cubit/reset_password_cubit.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm();

  @override
  Widget build(BuildContext context) {
    var cubit = ResetPasswordCubit.get(context);
    final GenericCubit<bool> showPassword = GenericCubit(false);
    final GenericCubit<bool> showConfirmPassword = GenericCubit(false);
    return Form(
        key: cubit.formKey,
        child: Column(
          children: [
            CustomTextField(
              controller: cubit.code,
              validator: (value) => value?.validateEmpty(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.phone,
              upperText: "كود التحقق",
              hint: "الرجاء ادخال الكود",
            ),
            BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
              bloc: showPassword,
              builder: (context, state) {
                return CustomTextField(
                  validator: (value) => value?.validatePassword(context),
                  fieldTypes:
                      state.data ? FieldTypes.normal : FieldTypes.password,
                  type: TextInputType.text,
                  controller: cubit.newPasswordController,
                  upperText: tr(context, "password"),
                  hint: tr(context, "insertPass"),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: ColorManager.primary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showPassword.onUpdateData(!state.data);
                    },
                    icon: state.data
                        ? Icon(
                            Icons.visibility,
                            color: ColorManager.primary,
                          )
                        : Icon(
                            Icons.visibility_off,
                            color: ColorManager.grey2,
                          ),
                  ),
                );
              },
            ),
            BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
              bloc: showConfirmPassword,
              builder: (context, state) {
                return CustomTextField(
                    validator: (value) => value?.validatePasswordConfirm(
                        context,
                        pass: cubit.newPasswordController.text),
                    fieldTypes:state.data ? FieldTypes.normal : FieldTypes.password,
                    type: TextInputType.text,
                    controller: cubit.confirmNewPasswordController,
                    upperText: tr(context, "confirmPassword"),
                    hint: tr(context, "insertConfirmPass"),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: ColorManager.primary,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        showConfirmPassword.onUpdateData(!state.data);
                      },
                      icon: state.data
                          ? Icon(
                              Icons.visibility,
                              color: ColorManager.primary,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: ColorManager.grey2,
                            ),
                    ));
              },
            ),
          ],
        ));
  }
}

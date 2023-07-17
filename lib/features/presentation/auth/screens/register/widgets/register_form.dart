import 'dart:developer';

import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/auth/blocs/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/base_widgets/custom_drop_down.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/assets_manager.dart';
import '../../../../../../core/resource/value_manager.dart';
import '../../../../../models/city_model.dart';


class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GenericCubit<bool> showPassCubit = GenericCubit(false);
    final GenericCubit<bool> showConfirmPassCubit = GenericCubit(false);
    var cubit = RegisterCubit.get(context);
    return Form(
        key: cubit.formKey,
        child: Column(
          children: [
            CustomTextField(
              validator: (value) => value?.validateEmpty(context),
              fieldTypes: FieldTypes.normal,
              controller: cubit.firstNameController,
              type: TextInputType.text,
              upperText: "الاسم الاول",
              hint: "الرجاء ادخال الاسم الاول",
              prefixIcon: Icon(
                Icons.person,
                color: ColorManager.primary,
              ),
            ),
            CustomTextField(
              validator: (value) => value?.validateEmpty(context),
              fieldTypes: FieldTypes.normal,
              controller: cubit.lastNameController,
              type: TextInputType.text,
              upperText: "الاسم الاخير",
              hint: "الرجاء ادخال الاسم الاخير",
              prefixIcon: Icon(
                Icons.person,
                color: ColorManager.primary,
              ),
            ),
            CustomTextField(
              upperText: tr(context, "phone"),
              validator: (value) => value?.validatePhone(context),
              fieldTypes: FieldTypes.normal,
              controller: cubit.phoneController,
              type: TextInputType.phone,
              hint: tr(context, 'phone'),
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
            CustomTextField(
              validator: (value) => value?.validateEmpty(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.emailAddress,
              controller: cubit.emailController,
              upperText: "البريد الالكترونى (اختياري) ",
              hint: "الرجاء ادخال البريد الالكترونى",
              prefixIcon: Icon(
                Icons.email,
                color: ColorManager.primary,
              ),
            ),
            BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
              bloc: showPassCubit,
              builder: (context, state) {
                return CustomTextField(
                  validator: (value) => value?.validatePassword(context),
                  fieldTypes:state.data ? FieldTypes.normal : FieldTypes.password,
                  type: TextInputType.text,
                  controller: cubit.passwordController,
                  upperText: "كلمة المرور",
                  hint: "الرجاء ادخال كلمة المرور",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: ColorManager.primary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showPassCubit.onUpdateData(!state.data);
                    },
                    icon: state.data ? Icon(
                      Icons.visibility, color: ColorManager.primary,) :
                    Icon(
                      Icons.visibility_off, color: ColorManager.grey2,),
                  ),
                );
              },
            ),
            BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
              bloc: showConfirmPassCubit,
              builder: (context, state) {
                return CustomTextField(
                  validator: (value) =>
                      value?.validatePasswordConfirm(context, pass: cubit
                          .passwordController.text),
                  fieldTypes:state.data ? FieldTypes.normal : FieldTypes.password,
                  controller: cubit.confirmPasswordController,
                  type: TextInputType.text,
                  upperText: "تأكيد كلمة المرور",
                  hint: "الرجاء ادخال تأكيد كلمة المرور",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: ColorManager.primary,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      showConfirmPassCubit.onUpdateData(!state.data);
                    },
                    icon: state.data ? Icon(
                      Icons.visibility, color: ColorManager.primary,) :
                    Icon(
                      Icons.visibility_off, color: ColorManager.grey2,),
                  ),
                );
              },
            ),
        cubit.state is CitiesLoading ? AppLoaderHelper.showSimpleLoading() :    DropdownButtonCustom<CityModel>(
              hintText: "اختر بلد",
              items: [
                for (var item in cubit.cities ?? [])
                  DropdownMenuItem<CityModel>(
                    value: item,
                    child: Text(
                      item.nameAr ?? '',
                    ),
                  )
              ],
              dropDownValue: cubit.cities?.first,
              onChangeAction: (v) {
                log("change : $v");
                cubit.selectedCity = v;
                log("change : ${cubit.selectedCity?.nameAr}");

              },
            )
          ],
        ));
  }
}

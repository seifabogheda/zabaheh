import 'dart:developer';

import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/localization/lang_cubit/lang_cubit.dart';
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
              upperText: tr(context, "firstName"),
              hint: tr(context, "insertFirstName"),
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
              upperText: tr(context, "insertLastName"),
              hint: tr(context, "insertLastName"),
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
                width: 120,
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
              upperText: tr(context, "mail"),
              hint: tr(context, "mail"),
              prefixIcon: Icon(
                Icons.email,
                color: ColorManager.primary,
              ),
            ),
            CustomTextField(
              validator: (value) => value?.validateEmpty(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.text,
              controller: cubit.address,
              upperText: tr(context, "address"),
              hint: tr(context, "address"),
              prefixIcon: Icon(
                Icons.add_location_outlined,
                color: ColorManager.primary,
              ),
            ),

          ],
        ));
  }
}

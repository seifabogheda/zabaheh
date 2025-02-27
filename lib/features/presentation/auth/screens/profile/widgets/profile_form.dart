
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/helpers/validator.dart';

import '../../../blocs/update_profile_cubit/update_profile_cubit.dart';


class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = UpdateProfileCubit.get(context);
    return Form(
      key: cubit.formKey,
        child: Column(
      children: [
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          controller: cubit.firstNameController,
          type: TextInputType.text,
          upperText: tr(context, 'firstName'),
          hint: tr(context, 'insertFirstName'),
          prefixIcon: Icon(
            Icons.person,
            color: ColorManager.primary,
          ),
          suffixIcon:  Image.asset(AssetsManager.edit,scale: 3,color: ColorManager.grey2,),
        ),
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          controller: cubit.lastNameController,
          type: TextInputType.text,
          upperText: tr(context, 'lastName'),
          hint: tr(context, 'insertLastName'),
          prefixIcon: Icon(
            Icons.person,
            color: ColorManager.primary,
          ),
          suffixIcon:  Image.asset(AssetsManager.edit,scale: 3,color: ColorManager.grey2,),
        ),
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          controller: cubit.emailController,
          upperText: tr(context, 'mail'),
          hint: "@gmail.com",
          prefixIcon: Icon(
            Icons.email,
            color: ColorManager.primary,
          ),
          suffixIcon:  Image.asset(AssetsManager.edit,scale: 3,color: ColorManager.grey2,),
        ),
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          controller: cubit.address,
          upperText: tr(context, 'address'),
          prefixIcon: Icon(
            Icons.location_on_outlined,
            color: ColorManager.primary,
          ),
          suffixIcon:  Image.asset(AssetsManager.edit,scale: 3,color: ColorManager.grey2,),
        ),
      ],
    ));
  }
}

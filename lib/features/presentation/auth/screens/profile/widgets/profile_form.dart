import 'dart:developer';

import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/base_widgets/custom_drop_down.dart';
import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/resource/value_manager.dart';
import 'package:base_flutter/core/helpers/validator.dart';


class ProfileForm extends StatelessWidget {
  final List<String> cities = ["saudi", "Egypt", "اختر بلد"];
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          upperText: "اسم المستخدم",
          hint: "الرجاء ادخال الاسم الاول",
          prefixIcon: Icon(
            Icons.person,
            color: ColorManager.primary,
          ),
          suffixIcon:  Image.asset(AssetsManager.edit,scale: 3,color: ColorManager.grey2,),
        ),
        CustomTextField(
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
        CustomTextField (
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          upperText: "البريد الالكترونى",
          hint: "seifabogheda89@gmail.com",
          prefixIcon: Icon(
            Icons.email,
            color: ColorManager.primary,
          ),
          suffixIcon:  Image.asset(AssetsManager.edit,scale: 3,color: ColorManager.grey2,),
        ),
        Align(alignment: Alignment.topRight,child: MyText(title: "المدينة",size: 14,color: ColorManager.black,)),
        DropdownButtonCustom<String>(
          hintText: "اختر بلد",
          items: [
            for (var item in cities)
              DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                ),
              )
          ],
          dropDownValue: cities.last,
          onChangeAction: (v) {
            log("change : $v");
          },
        )
      ],
    ));
  }
}

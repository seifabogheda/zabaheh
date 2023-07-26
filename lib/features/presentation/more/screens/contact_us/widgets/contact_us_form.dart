import 'package:base_flutter/features/presentation/more/cubits/contact_us_cubit/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    var cubit = context.read<ContactUsCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextField(
            validator: (value) => value?.validateEmpty(context),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            upperText: "الاسم",
            hint: "رجاء ادخال الاسم",
            controller: cubit.nameController,
          ),
          CustomTextField(
            upperText: tr(context,"phone"),
            validator: (value) => value?.validatePhone(context),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.phone,
            controller: cubit.phoneController,
            hint: tr(context,'phone'),
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
            upperText: "ال${tr(context,"sr")}الة",
            hint: "برجاء كتابة ال${tr(context,"sr")}اله",
            controller: cubit.messageController,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

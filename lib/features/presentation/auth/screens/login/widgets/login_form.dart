import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:base_flutter/features/presentation/auth/blocs/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/resource/assets_manager.dart';
import '../../../../../../core/resource/color_manager.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GenericCubit<bool> showPasswordCubit = GenericCubit(false);
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        var cubit = LoginCubit.get(context);
        return Form(
            key: cubit.formKey,
            child: CustomTextField(
              upperText: tr(context, "phone"),
              validator: (value) => value?.validatePhone(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.phone,
              controller: cubit.phoneController,
              hint: tr(context, 'phone'),
              prefixIcon: Icon(
                Icons.phone_android_sharp,
                color: ColorManager.primary,
              ),
              suffixIcon: Container(
                width: 150,
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
            ));
      },
    );
  }
}

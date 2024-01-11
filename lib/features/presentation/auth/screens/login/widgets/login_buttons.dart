import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_button.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/font_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/utils_imports.dart';
import 'package:base_flutter/features/presentation/auth/blocs/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/features/presentation/auth/blocs/login_cubit/login_cubit.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../../main_navigation_bar/main_navigation_bar.dart';
import '../../../blocs/register_cubit/register_cubit.dart';
import '../../register/register_view.dart';

class LoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            var cubit = LoginCubit.get(context);
            if (state is LoginLoading) {
              return AppLoaderHelper.showLoadingView();
            }
            if (state is LoginSuccess) {
              return CustomButton(
                title: tr(context, 'login'),
                onTap: () {
                  NavigationService.removeUntil(MainNavigationBar());
                },
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              );
            } else {
              return CustomButton(
                title: tr(context, 'login'),
                onTap: () {
                  cubit.login(context);
                },
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              );
            }
          },
        ),
        CustomTextButton(
          title: tr(context, "skip"),
          onTap: () {
            context.read<AuthCubit>().onUpdateAuth(false);
            NavigationService.removeUntil(MainNavigationBar());
          },
          color: ColorManager.grey2,
        ),
        Text.rich(
          TextSpan(
            text: tr(context, "don'tHaveAccount"),
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: ColorManager.black,
                fontFamily: FontConstants.fontFamily),
            children: <InlineSpan>[
              TextSpan(
                text: tr(context, "register"),
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: ColorManager.primary,
                    fontFamily: FontConstants.fontFamily),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    NavigationService.navigateTo(BlocProvider(
                      create: (context) => RegisterCubit()..getCities(),
                      child: RegisterView(),
                    ));
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

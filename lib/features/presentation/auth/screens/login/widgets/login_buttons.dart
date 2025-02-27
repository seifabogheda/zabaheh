import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';

import 'package:base_flutter/features/presentation/auth/blocs/login_cubit/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/app_localizations.dart';


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
                  cubit.login(context);
                },
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              );
            } else {
              return CustomButton(
                title: tr(context, 'login'),
                onTap: () {
                  cubit.login(context);
                  // NavigationService.removeUntil(MainNavigationBar());
                },
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              );
            }
          },
        ),
        // CustomTextButton(
        //   title: tr(context, "skip"),
        //   onTap: () {
        //     context.read<AuthCubit>().onUpdateAuth(false);
        //     NavigationService.removeUntil(MainNavigationBar());
        //   },
        //   color: ColorManager.grey2,
        // ),
        // Text.rich(
        //   TextSpan(
        //     text: tr(context, "don'tHaveAccount"),
        //     style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.normal,
        //         color: ColorManager.black,
        //         fontFamily: FontConstants.fontFamily),
        //     children: <InlineSpan>[
        //       TextSpan(
        //         text: tr(context, "register"),
        //         style: TextStyle(
        //             fontSize: 14,
        //             fontWeight: FontWeight.normal,
        //             color: ColorManager.primary,
        //             fontFamily: FontConstants.fontFamily),
        //         recognizer: TapGestureRecognizer()
        //           ..onTap = () {
        //             NavigationService.navigateTo(BlocProvider(
        //               create: (context) => RegisterCubit(),
        //               child: RegisterView(),
        //             ));
        //           },
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';

import 'package:base_flutter/features/custom_widgets/logo_widget.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/widgets/reset_password_form.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/widgets/reset_password_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/resource/navigation_service.dart';
import '../../../blocs/reset_password_cubit/reset_password_cubit.dart';
import '../../login/login_view.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => ResetPasswordCubit(),
        child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          builder: (context, state) {
            var cubit = ResetPasswordCubit.get(context);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    LogoWidget(),
                    ResetPasswordTexts(),
                    ResetPasswordForm(),
                    state is ResetPasswordLoading
                        ? AppLoaderHelper.showLoadingView()
                        : CustomButton(
                            title: tr(context, "confirm"),
                            onTap: () {
                              // cubit.resetPassword();
                              NavigationService.navigateAndReplacement(
                                  LoginView());
                            },
                          )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

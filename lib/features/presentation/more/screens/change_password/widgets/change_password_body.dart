import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/auth/blocs/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'change_password_form.dart';

class ChangePasswordBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (context, state) {
      var cubit = ChangePasswordCubit.get(context);
      return Padding(
        padding: const EdgeInsets.only(top: 35.0, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ChangePasswordForm(),
              state is ChangePasswordLoading
                  ? AppLoaderHelper.showLoadingView()
                  : CustomButton(
                      title: tr(context, "confirm"),
                      onTap: () {
                        cubit.changePassword();
                      },
                    ),
            ],
          ),
        ),
      );
    });
  }
}

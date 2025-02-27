import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/widgets/register_form.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/widgets/register_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/base_widgets/custom_button.dart';
import '../../../../../../core/helpers/app_loader_helper.dart';
import '../../../../../../core/helpers/snack_helper.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../blocs/register_cubit/register_cubit.dart';

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterFailed) {
          SnackBarHelper.showBasicSnack(
              msg: state.error, color: ColorManager.error);
        }
      },
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                RegisterTexts(),
                RegisterForm(),
                state is RegisterLoading
                    ? AppLoaderHelper.showLoadingView()
                    : CustomButton(
                        title: tr(context, 'confirm'),
                        onTap: () {
                          cubit.register(context);
                          // NavigationService.back();
                        },
                        margin:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                      ),
                SvgPicture.asset(AssetsManager.undraw_good),
              ],
            ),
          ),
        );
      },
    );
  }
}

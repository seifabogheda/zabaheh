import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_button.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:base_flutter/features/repos/repo_impl.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../blocs/update_profile_cubit/update_profile_cubit.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = UpdateProfileCubit.get(context);
    BaseRepo repo = RepoImpl();
    return Column(
      children: [
        cubit.state is UpdateProfileLoading
            ? AppLoaderHelper.showLoadingView()
            : CustomButton(
                title: tr(context, 'saveChanges'),
                onTap: () {
                  cubit.updateProfile();
                },
              ),
        CustomTextButton(
          title: tr(context, 'deleteAccount'),
          onTap: () async {
            await repo.deleteAcc();
          },
          color: ColorManager.error,
        ),
      ],
    );
  }
}

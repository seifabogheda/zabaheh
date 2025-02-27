
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/value_manager.dart';
import '../../auth/blocs/auth_cubit/auth_cubit.dart';
import '../../auth/blocs/user_cubit/user_cubit.dart';
import '../../notifications/notifications_view.dart';
import '../../search/search_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    var auth = context.read<AuthCubit>().state.authorized;

    return Container(
      padding: EdgeInsets.only(top: 40, left: 10, right: 10),
      height: context.height *0.25,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          auth?     Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(
                    title: "${tr(context, 'welcome')}, ",
                    size: 16,
                    color: ColorManager.white,
                    fontWeight: FontWeight.w600,
                  ),
                  MyText(
                    title: context.read<UserCubit>().state.model.name ?? '',
                    size: 14,
                    color: ColorManager.white,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              InkWell(
                onTap: ()=>NavigationService.navigateTo(NotificationsView()),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                  child: SvgPicture.asset(
                    AssetsManager.notification_icon, height: 40,
                    // color: ColorManager.primary,
                  ),
                ),
              )
            ],
          ):SizedBox(),
          CustomTextField(
            validator: (value) => value?.noValidate(),
            fieldTypes: FieldTypes.clickable,
            type: TextInputType.none,
            suffixIcon: Icon(Icons.search),
            hint: tr(context,"search"),
            onTap: () {
              auth?    NavigationService.navigateTo(SearchView()):
              SnackBarHelper.showBasicSnack(msg: tr(context, 'loginFirst'));
            },
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(200);
}

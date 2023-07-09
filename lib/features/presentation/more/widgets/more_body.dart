import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:base_flutter/features/presentation/more/widgets/more_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../repos/auth_repo_impl.dart';
import '../../../repos/base_repo.dart';
import '../../auth/blocs/auth_cubit/auth_cubit.dart';
import '../../auth/screens/profile/profile_view.dart';
import '../screens/about/about_view.dart';
import '../screens/change_lang/change_lang_view.dart';
import '../screens/contact_us/contact_us_view.dart';
import '../screens/policy/policy_view.dart';
import '../screens/terms/terms_view.dart';

class MoreBody extends StatelessWidget {
  const MoreBody();

  @override
  Widget build(BuildContext context) {
    var auth = context.read<AuthCubit>().state.authorized;
    BaseRepo authRepo = AuthRepoImpl();

    return ListView(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: MyText(
            title: "معلومات حسابى",
            size: 12,
            color: ColorManager.grey2,
            fontWeight: FontWeight.w600,
          ),
        ),
        MoreItem(
          titleItem: 'الملف الشخصي',
          imageItem: AssetsManager.profile,
          onTap: () {
            NavigationService.navigateTo(ProfileView());
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: MyText(
            title: "إعدادات عامة",
            size: 12,
            color: ColorManager.grey2,
            fontWeight: FontWeight.w600,
          ),
        ),
        MoreItem(
          titleItem: 'إعدادات اللفة',
          imageItem: AssetsManager.translate,
          onTap: () {
            NavigationService.navigateTo(ChangeLangView());
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: MyText(
            title: "معلومات عامة",
            size: 12,
            color: ColorManager.grey2,
            fontWeight: FontWeight.w600,
          ),
        ),
        MoreItem(
          titleItem: 'من نحن',
          imageItem: AssetsManager.about,
          onTap: () {
            NavigationService.navigateTo(AboutView());
          },
        ),
        MoreItem(
          titleItem: 'تواصل معنا',
          imageItem: AssetsManager.contactus,
          onTap: () {
            NavigationService.navigateTo(ContactUsView());
          },
        ),
        MoreItem(
          titleItem: 'سياسة الخصوصية',
          imageItem: AssetsManager.policy,
          onTap: () {
            NavigationService.navigateTo(PolicyView());
          },
        ),
        MoreItem(
          titleItem: 'الشروط والاحكام',
          imageItem: AssetsManager.terms,
          onTap: () {
            NavigationService.navigateTo(TermsView());
          },
        ),
        MoreItem(
          titleItem: 'قيم التطبيق',
          imageItem: AssetsManager.wallet,
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        MoreItem(
          titleItem:auth? tr(context,"logout") : tr(context,"login"),
          imageItem: AssetsManager.logout,
          onTap: () {
            auth ? authRepo.logout() : NavigationService.removeUntil(LoginView());
          },
          isLogout: true,
        ),
      ],
    );
  }
}

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:base_flutter/features/presentation/more/cubits/contact_us_cubit/contact_us_cubit.dart';
import 'package:base_flutter/features/presentation/more/cubits/settings_cubit/settings_cubit.dart';
import 'package:base_flutter/features/presentation/more/widgets/more_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../repos/repo_impl.dart';
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
    var auth = context
        .read<AuthCubit>()
        .state
        .authorized;
    BaseRepo authRepo = RepoImpl();

    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return ListView(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          children: [
            auth ? Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: MyText(
                title: tr(context, "accountInfo"),
                size: 12,
                color: ColorManager.grey2,
                fontWeight: FontWeight.w600,
              ),
            ) : SizedBox(),
            auth ? MoreItem(
              titleItem: tr(context, "profile"),
              imageItem: AssetsManager.profile,
              onTap: () {
                NavigationService.navigateTo(ProfileView());
              },
            ) : SizedBox(),
            auth ? Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: MyText(
                title: tr(context, "publicSettings"),
                size: 12,
                color: ColorManager.grey2,
                fontWeight: FontWeight.w600,
              ),
            ) : SizedBox(),
            auth ? MoreItem(
              titleItem: tr(context, "langSettings"),
              imageItem: AssetsManager.translate,
              onTap: () {
                NavigationService.navigateTo(ChangeLangView());
              },
            ) : SizedBox(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: MyText(
                title: tr(context, "otherInfo"),
                size: 12,
                color: ColorManager.grey2,
                fontWeight: FontWeight.w600,
              ),
            ),
            MoreItem(
              titleItem: tr(context, "about"),
              imageItem: AssetsManager.about,
              onTap: () {
                NavigationService.navigateTo(AboutView());
              },
            ),
            auth ? MoreItem(
              titleItem: tr(context, "contactUs"),
              imageItem: AssetsManager.contactus,
              onTap: () {
                NavigationService.navigateTo(BlocProvider(
                  create: (context) => ContactUsCubit(),
                  child: ContactUsView(),
                ));
              },
            ) : SizedBox(),
            MoreItem(
              titleItem: tr(context, "policy"),
              imageItem: AssetsManager.policy,
              onTap: () {
                NavigationService.navigateTo(PolicyView());
              },
            ),
            MoreItem(
              titleItem: tr(context, "terms"),
              imageItem: AssetsManager.terms,
              onTap: () {
                NavigationService.navigateTo(TermsView());
              },
            ),
            // MoreItem(
            //   titleItem: tr(context, "rateApp"),
            //   imageItem: AssetsManager.wallet,
            //   onTap: () {},
            // ),
            SizedBox(
              height: 10,
            ),
            MoreItem(
              titleItem: auth ? tr(context, "logout") : tr(context, "login"),
              imageItem: AssetsManager.logout,
              onTap: () {
                auth
                    ? authRepo.logout()
                    : NavigationService.removeUntil(LoginView());
              },
              isLogout: true,
            ),
          ],
        );
      },
    );
  }
}

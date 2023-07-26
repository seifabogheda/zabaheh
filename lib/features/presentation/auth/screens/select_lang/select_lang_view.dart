import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/base_widgets/custom_button.dart';
import '../../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/resource/assets_manager.dart';
import '../../../../../core/resource/navigation_service.dart';
import '../../../../../core/utils/utils_imports.dart';
import '../login/login_view.dart';

class SelectLangView extends StatelessWidget {
  void setUserLang(BuildContext context, String lang) async {
    Utils.changeLanguage(lang, context);
    NavigationService.navigateTo(LoginView());
  }

  @override
  Widget build(BuildContext context) {
    final GenericCubit<String> langBloc = GenericCubit('');
    return AuthCustomAppBar(
        title: tr(context, "selectLang"),
        needBack: false,
        child: Expanded(
          child: BlocBuilder<GenericCubit<String>, GenericState<String>>(
            bloc: langBloc,
            builder: (_, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Container(
                    alignment: Alignment.center,
                    child: MyText(
                      title: tr(context, "selectLang"),
                      size: 23,
                      fontWeight: FontWeight.w600,
                      color: ColorManager.black,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          langBloc.onUpdateData('ar');
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppMargin.m8,
                              vertical: AppMargin.m12),
                          width: 130,
                          height: 130,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: state.data == "ar"
                                ? ColorManager.primary
                                : ColorManager.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.grey,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: ColorManager.offWhite,
                                child: SvgPicture.asset(AssetsManager.saudi),
                              ),
                              Center(
                                child: MyText(
                                  color: ColorManager.black,
                                  size: 16,
                                  title: tr(context, "langAr"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          langBloc.onUpdateData('en');
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: AppMargin.m8,
                              vertical: AppMargin.m12),
                          width: 130,
                          height: 130,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                            color: state.data == "en"
                                ? ColorManager.primary
                                : ColorManager.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.grey,
                                spreadRadius: 1,
                              )
                            ],
                          ),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: ColorManager.offWhite,
                                child: SvgPicture.asset(
                                    AssetsManager.united_states),
                              ),
                              Center(
                                child: MyText(
                                  color: ColorManager.black,
                                  size: 16,
                                  title: tr(context, "langEn"),
                                ),
                              )
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                    title: tr(context, "confirm"),
                    width: 300,
                    margin: EdgeInsets.only(bottom: 25),
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      setUserLang(context, state.data);
                    },
                  ),
                ],
              );
            },
          ),
        ));
  }
}

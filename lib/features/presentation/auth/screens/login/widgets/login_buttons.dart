


import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_button.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/font_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../../../main_navigation_bar/cubits/main_navigation_cubit.dart';
import '../../../../main_navigation_bar/main_navigation_bar.dart';
import '../../register/register_view.dart';

class LoginButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(title: tr(context,'login'),onTap: (){
          NavigationService.removeUntil(BlocProvider(create:  (context) => BottomNavCubit(),child: MainNavigationBar()));
        },margin: EdgeInsets.symmetric(horizontal: 30,vertical: 25),),
        CustomTextButton(title: "تخطي التسجيل", onTap: (){},color: ColorManager.grey2,),
        Text.rich(
            TextSpan(
                text: tr(context,"don'tHaveAccount"),
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: ColorManager.black,fontFamily: FontConstants.fontFamily),
                children: <InlineSpan>[
                  TextSpan(
                    text: tr(context,"register"),
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: ColorManager.primary,fontFamily: FontConstants.fontFamily),
                    recognizer: TapGestureRecognizer()..onTap=(){
                      NavigationService.navigateTo(RegisterView());
                    }
                  )
                ]
            )
        )
      ],
    );
  }
}

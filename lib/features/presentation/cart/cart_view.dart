import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/cart/widgets/cart_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/base_widgets/custom_button.dart';
import '../../../core/base_widgets/my_text.dart';
import '../../../core/resource/navigation_service.dart';
import '../../custom_widgets/app_custom_appbar.dart';
import '../auth/blocs/auth_cubit/auth_cubit.dart';
import '../auth/screens/login/login_view.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var auth = context.read<AuthCubit>().state.authorized;

    return AppCustomAppbar(
      titlePage: tr(context, "cart"),
      body: auth
          ? CartBody()
          : Center(
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MyText(title: "يجب تسجيل الدخول اولا",size: 18,),
                  SizedBox(height: 15,),
                  CustomButton(
                    width: context.width*0.35,
                    title: tr(context, "login"),
                    onTap: () {
                      NavigationService.navigateTo(LoginView());
                    },
                  )
                ],
              ),
          ),
    );
  }
}

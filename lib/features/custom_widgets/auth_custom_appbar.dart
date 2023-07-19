

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';

import '../../core/base_widgets/my_text.dart';
import '../../core/resource/color_manager.dart';
import '../../core/resource/navigation_service.dart';
import '../../core/resource/value_manager.dart';

class AuthCustomAppBar extends StatelessWidget {
  final String title;
  final bool needBack;
  final Widget child;
  final Widget? bottomNavigationBar;
  final Color? scaffoldColor;
  final Color? textColor;

  const AuthCustomAppBar({Key? key, required this.title, required this.needBack, required this.child, this.scaffoldColor, this.textColor, this.bottomNavigationBar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor ?? ColorManager.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: AppPadding.p24,right: 10,left: 10),
            height: context.height * 0.14,
            color: ColorManager.white,
            child: Row(
              children: [
                needBack ?    IconButton(
                  onPressed: () => NavigationService.back(),
                  icon: Icon(Icons.adaptive.arrow_back,color: textColor ?? ColorManager.black,),
                ):SizedBox(),
                MyText(
                  title: title,
                  color:textColor ?? ColorManager.black,
                  size: 17,
                ),
              ],
            ),
          ),
          child,
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

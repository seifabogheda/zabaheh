import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCustomAppbar extends StatelessWidget {
  final String titlePage;
  final Widget body;

  const AppCustomAppbar({Key? key, required this.titlePage, required this.body})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      appBar: AppBar(
        backgroundColor: ColorManager.white,
        elevation: 0,
        leadingWidth: 70,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4),
          child: Center(
              child: MyText(
            title: titlePage,
            color: ColorManager.black,
            size: 17,
            fontWeight: FontWeight.bold,
          )),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: SvgPicture.asset(
              AssetsManager.notification_icon,
              color: ColorManager.primary,
            ),
          )
        ],
      ),
      body: body,
    );
  }
}

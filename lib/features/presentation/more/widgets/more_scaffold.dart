import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';

class MoreScaffold extends StatelessWidget {
  final String titleScreen;
  final Widget body;
  const MoreScaffold({required this.titleScreen, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.offWhite,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.white,
        leadingWidth: 30,
        leading: IconButton(
          padding: EdgeInsets.symmetric(horizontal: 15),
          icon: Icon(
            Icons.adaptive.arrow_back,
            color: ColorManager.black,
          ),
          onPressed: () => NavigationService.back(),
        ),
        title: MyText(
          title: titleScreen,
          color: ColorManager.black,
          size: 18,
        ),
      ),
      body: Container(
        height: context.height * 0.8,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: body,
      ),
    );
  }
}

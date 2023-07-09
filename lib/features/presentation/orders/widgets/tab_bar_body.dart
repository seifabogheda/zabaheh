import 'package:base_flutter/features/presentation/orders/widgets/tab_bar_item.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';

class TabBarBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: TabBar(
        indicator: BoxDecoration(
          color: ColorManager.primary,
          borderRadius: BorderRadius.circular(5),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: ColorManager.white,
        unselectedLabelColor: ColorManager.grey,
        labelStyle: TextStyle(
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: ColorManager.white),
        unselectedLabelStyle: TextStyle(
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeight.w600,
            fontSize: 14,
            color: ColorManager.grey),
        tabs: [
          TabBarItem(title: tr(context, "current")),
          TabBarItem(title: tr(context, "finished")),
        ],
      ),
    );
  }
}

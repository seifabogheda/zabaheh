import 'dart:developer';

import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/value_manager.dart';
import '../../search/search_view.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40, left: 10, right: 10),
      height: 180,
      decoration: BoxDecoration(
        color: ColorManager.primary,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                title: "الرياض",
                size: 20,
                color: ColorManager.white,
                fontWeight: FontWeight.w600,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                child: SvgPicture.asset(
                  AssetsManager.notification_icon, height: 40,
                  // color: ColorManager.primary,
                ),
              )
            ],
          ),
          CustomTextField(
            validator: (value) => value?.noValidate(),
            fieldTypes: FieldTypes.clickable,
            type: TextInputType.none,
            suffixIcon: Icon(Icons.search),
            hint: "ابحث عما تريد....",
            onTap: () {
              NavigationService.navigateTo(SearchView());
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

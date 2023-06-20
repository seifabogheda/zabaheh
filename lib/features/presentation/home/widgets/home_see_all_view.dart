import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../custom_widgets/animal_item.dart';

class HomeSeeAllView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
        scaffoldColor: ColorManager.offWhite,
        title: "نعيمي بلدي",
        needBack: true,
        textColor: ColorManager.green,
        child: Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return AnimalItem();
              }),
        ));
  }
}

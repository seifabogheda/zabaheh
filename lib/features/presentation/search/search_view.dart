import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/search/widgets/search_body.dart';
import 'package:flutter/material.dart';

import '../../../core/resource/color_manager.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
      scaffoldColor: ColorManager.offWhite,
      textColor: ColorManager.green,
      title: "نتيجة البحث",
      needBack: true,
      child: SearchBody(),
    );
  }
}

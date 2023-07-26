import 'package:base_flutter/features/presentation/more/widgets/more_body.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../custom_widgets/app_custom_appbar.dart';

class MoreView extends StatelessWidget {
  const MoreView();

  @override
  Widget build(BuildContext context) {
    return AppCustomAppbar(
      titlePage: tr(context,"more"),
      body: MoreBody(),
    );
  }
}

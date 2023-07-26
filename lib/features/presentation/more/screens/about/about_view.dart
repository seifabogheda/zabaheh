import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/more/screens/about/widgets/about_body.dart';
import 'package:flutter/material.dart';

import '../../widgets/more_scaffold.dart';

class AboutView extends StatelessWidget {
  const AboutView();

  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: tr(context, "about"),
      body: AboutBody(),
    );
  }
}

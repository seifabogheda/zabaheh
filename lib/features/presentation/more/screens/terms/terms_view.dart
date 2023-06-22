

import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/more/screens/terms/widgets/terms_body.dart';
import 'package:flutter/material.dart';

import '../../widgets/more_scaffold.dart';

class TermsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: tr(context,"terms"),
      body: TermsBody(),
    );
  }
}

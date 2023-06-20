import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/auth/screens/active_code/widgets/active_body.dart';
import 'package:flutter/material.dart';

class ActiveView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
        title: tr("register"), needBack: false, child: ActiveBody());
  }
}

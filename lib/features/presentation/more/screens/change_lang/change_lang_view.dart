import 'package:base_flutter/features/presentation/more/screens/change_lang/widgets/change_lang_body.dart';
import 'package:flutter/material.dart';
import '../../../../../core/localization/app_localizations.dart';
import '../../../../custom_widgets/auth_custom_appbar.dart';


class ChangeLangView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(title: tr(context, "langSettings"), needBack: true,child: ChangeLangBody(),);
  }
}

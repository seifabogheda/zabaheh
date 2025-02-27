

import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/more/cubits/settings_cubit/settings_cubit.dart';
import 'package:base_flutter/features/presentation/more/screens/terms/widgets/terms_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/more_scaffold.dart';

class TermsView extends StatefulWidget {

  @override
  State<TermsView> createState() => _TermsViewState();
}

class _TermsViewState extends State<TermsView> {
  @override
  void initState() {
    context.read<SettingsCubit>().getSettings("terms");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: tr(context,"terms"),
      body: TermsBody(),
    );
  }
}

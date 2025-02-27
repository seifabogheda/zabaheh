import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/more/screens/about/widgets/about_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings_cubit/settings_cubit.dart';
import '../../widgets/more_scaffold.dart';

class AboutView extends StatefulWidget {
  const AboutView();

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  void initState() {
    context.read<SettingsCubit>().getSettings("");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: tr(context, "about"),
      body: AboutBody(),
    );
  }
}

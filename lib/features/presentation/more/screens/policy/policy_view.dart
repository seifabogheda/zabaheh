

import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/more/screens/policy/widgets/policy_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/settings_cubit/settings_cubit.dart';
import '../../widgets/more_scaffold.dart';

class PolicyView extends StatefulWidget {

  @override
  State<PolicyView> createState() => _PolicyViewState();
}

class _PolicyViewState extends State<PolicyView> {
  @override
  void initState() {
    context.read<SettingsCubit>().getSettings("privacy");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: tr(context, 'privacy'),
      body: PolicyBody(),
    );
  }
}

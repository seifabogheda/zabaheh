import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/more/cubits/contact_us_cubit/contact_us_cubit.dart';
import 'package:base_flutter/features/presentation/more/screens/contact_us/widgets/contact_us_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/more_scaffold.dart';

class ContactUsView extends StatefulWidget {
  @override
  State<ContactUsView> createState() => _ContactUsViewState();
}

class _ContactUsViewState extends State<ContactUsView> {
  @override
  void initState() {
    context.read<ContactUsCubit>().getSettings();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: tr(context, 'contactUs'),
      body: ContactUsBody(),
    );
  }
}

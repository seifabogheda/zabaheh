import 'package:base_flutter/features/presentation/auth/screens/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../more/widgets/more_scaffold.dart';
import '../../blocs/update_profile_cubit/update_profile_cubit.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: tr(context, 'provider'),
      body: BlocProvider(
        create: (context) => UpdateProfileCubit()..getProfileData(),
        child: ProfileBody(),
      ),
    );
  }
}

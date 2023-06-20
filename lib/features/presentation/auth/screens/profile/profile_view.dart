
import 'package:base_flutter/features/presentation/auth/screens/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';

import '../../../more/widgets/more_scaffold.dart';


class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MoreScaffold(titleScreen: 'الملف الشخصي', body: ProfileBody(),);
  }
}

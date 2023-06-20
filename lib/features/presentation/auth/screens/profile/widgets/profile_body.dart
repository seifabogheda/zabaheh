import 'package:base_flutter/features/presentation/auth/screens/profile/widgets/profile_buttons.dart';
import 'package:base_flutter/features/presentation/auth/screens/profile/widgets/profile_form.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProfileForm(),
        ProfileButtons(),
      ],
    );
  }
}

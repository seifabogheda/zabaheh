import 'package:base_flutter/features/presentation/auth/blocs/update_profile_cubit/update_profile_cubit.dart';
import 'package:base_flutter/features/presentation/auth/screens/profile/widgets/profile_buttons.dart';
import 'package:base_flutter/features/presentation/auth/screens/profile/widgets/profile_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
      builder: (context, state) {
        return ListView(
          children: [
            ProfileForm(),
            ProfileButtons(),
          ],
        );
      },
    );
  }
}

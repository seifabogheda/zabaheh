import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/logo_widget.dart';
import 'package:base_flutter/features/presentation/more/cubits/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AboutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LogoWidget(),
        MyText(
          color: ColorManager.black,
            size: 12,
            fontWeight: FontWeight.bold,
            title:  context.read<SettingsCubit>().state.settings[2].value ?? ''),
      ],
    );
  }
}

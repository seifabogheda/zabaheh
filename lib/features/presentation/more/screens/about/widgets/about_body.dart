import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/logo_widget.dart';
import 'package:base_flutter/features/presentation/more/cubits/settings_cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/app_loader_helper.dart';
import '../../../../../../core/utils/enums.dart';

class AboutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        LogoWidget(),
        const SizedBox(height: 30,),
        BlocBuilder<SettingsCubit, SettingsState>(
          builder: (context, state) {
            if(state.settingsState == RequestState.loading){
              return Center(child: AppLoaderHelper.showSimpleLoading(),);
            }
            if(state.settingsState == RequestState.loaded){
              return MyText(
                color: ColorManager.black,
                size: 12,
                fontWeight: FontWeight.bold,
                title: state.settings ?? '',
              );
            }else{
              return const SizedBox();
            }
          },
        ),
      ],
    );
  }
}

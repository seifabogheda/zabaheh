import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/more/cubits/contact_us_cubit/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contact_us_social.dart';

class ContactUsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
      builder: (context, state) {
       if(state.settingsState == RequestState.loading){
         return Center(child: AppLoaderHelper.showLoadingView(),);
       }
       if(state.settingsState == RequestState.loaded){
         return ContactUsSocial();
       }else{
         return const SizedBox();
       }
      },
    );
  }
}

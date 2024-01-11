import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/search/cubit/search_cubit.dart';
import 'package:base_flutter/features/presentation/search/widgets/search_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resource/color_manager.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
      scaffoldColor: ColorManager.offWhite,
      textColor: ColorManager.primary,
      title: "نتيجة البحث",
      needBack: true,
      child: BlocProvider(
        create: (context) => SearchCubit(),
        child: SearchBody(),
      ),
    );
  }
}

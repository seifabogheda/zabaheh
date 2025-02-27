import 'dart:developer';

import 'package:base_flutter/features/models/home_model.dart';
import 'package:base_flutter/features/presentation/home/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/helpers/app_loader_helper.dart';
import '../../../../core/localization/app_localizations.dart';
import '../cubits/slider_cubit/slider_cubit.dart';
import 'home_list.dart';
import 'home_swiper.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        BlocProvider(
          create: (context) =>
          SliderCubit()
            ..getSlider(),
          child: HomeSwiper(),
        ),
        SizedBox(
          height: 10,
        ),

        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Expanded(
                  child: Center(
                    child: AppLoaderHelper.showSimpleLoading(),
                  ));
            } else {
              return state is HomeSuccess
                  ? HomeList(
                model: state.home,
              )
                  : Expanded(
                child: Center(
                  child: MyText(
                    title: tr(context,"noData"),
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

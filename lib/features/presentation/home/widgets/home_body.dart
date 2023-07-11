import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/features/presentation/home/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        HomeSwiper(),
        SizedBox(
          height: 10,
        ),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return Expanded(child: Center(child: AppLoaderHelper.showSimpleLoading(),));
            } else {
              return state is HomeSuccess
                  ? Expanded(
                      child: ListView.builder(
                        itemCount: state.home.length,
                        itemBuilder: (_, index) {
                          return HomeList(
                            model: state.home[index],
                          );
                        },
                      ),
                    )
                  : SizedBox();
            }
          },
        ),
      ],
    );
  }
}

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/home/cubits/slider_cubit/slider_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/localization/app_localizations.dart';

class HomeSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if(state.sliderState == RequestState.loading){
          return Center(child: AppLoaderHelper.showSimpleLoading(),);
        }
        if(state.sliderState == RequestState.loaded)
          return Container(
            height: 140,
            child: Swiper(
              pagination: new SwiperPagination(),
              itemCount: state.sliderList.length,
              autoplay: true,
              itemWidth: MediaQuery
                  .of(context)
                  .size
                  .width * .9,
              layout: SwiperLayout.DEFAULT,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: CachedImage(
                    url: state.sliderList[index].fileName ?? '',
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              },
            ),
          );
        return Center(child: MyText(title: tr(context,"noData"),),);

      },
    );
  }
}

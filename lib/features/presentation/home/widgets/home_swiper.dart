import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

import '../../../../core/base_widgets/cache_image.dart';

class HomeSwiper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> slider = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA2Nyo6Kgr43mj1hQnuypINqA0RjFtwWujzg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9dzIHVAv1xLixcBkhvrQczkClOugFe5qPtg&usqp=CAU",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSCDoVVCv83tk1XnWVmIB3niuOI7X1A3m8W3A&usqp=CAU"
    ];
    return Container(
      height: 140,
      child: Swiper(
        pagination: new SwiperPagination(),
        itemCount: slider.length,
        autoplay: true,
        itemWidth: MediaQuery.of(context).size.width * .9,
        layout: SwiperLayout.DEFAULT,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: CachedImage(
              url: slider[index],
              borderRadius: BorderRadius.circular(10),
            ),
          );
        },
      ),
    );
  }
}

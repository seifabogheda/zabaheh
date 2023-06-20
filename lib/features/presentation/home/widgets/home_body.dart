import 'package:flutter/material.dart';

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
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (_, index) {
              return HomeList();
            },
          ),
        ),
      ],
    );
  }
}

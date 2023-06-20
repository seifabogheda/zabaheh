

import 'package:base_flutter/features/presentation/animal_details/widgets/animal_details_swiper.dart';
import 'package:flutter/material.dart';

import 'all_addition.dart';
import 'animal_description.dart';

class BuildAnimalBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Expanded(child: ListView(
      children: [
        AnimalDetailsSwiper(),
        AnimalDescription(),
        AllAddition(),
      ],
    ));
  }
}

import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/features/presentation/animal_details/cubits/product_details/product_details_cubit.dart';
import 'package:base_flutter/features/presentation/animal_details/widgets/animal_details_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'all_addition.dart';
import 'animal_description.dart';

class BuildAnimalBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsSuccess) {
          return Expanded(
            child: ListView(
              children: [
                AnimalDetailsSwiper(image: state.products.image ?? '',),
                AnimalDescription(
                  title: state.products.name ?? '',
                  desc: state.products.description ?? '',
                ),
                AllAddition(),
              ],
            ),
          );
        }
        return AppLoaderHelper.showSimpleLoading();
      },
    );
  }
}

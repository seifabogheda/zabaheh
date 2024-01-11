import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/home/cubits/all_products_cubit/all_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../custom_widgets/animal_item.dart';

class HomeSeeAllView extends StatelessWidget {
  final String categoryTitle;

  const HomeSeeAllView({Key? key, required this.categoryTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
      scaffoldColor: ColorManager.offWhite,
      title: categoryTitle,
      needBack: true,
      textColor: ColorManager.primary,
      child: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          if (state is AllProductsLoading) {
            return AppLoaderHelper.showSimpleLoading();
          }
          if (state is AllProductsSuccess) {
            return Expanded(
              child: ListView.builder(
                  itemCount: state.allProducts.length,
                  itemBuilder: (context, index) {
                    return AnimalItem(
                      product: state.allProducts[index],
                    );
                  }),
            );
          } else {
            return Expanded(
              child: Center(
                  child: MyText(
                    title: tr(context, "noData"),
                  )),
            );
          }
        },
      ),
    );
  }
}

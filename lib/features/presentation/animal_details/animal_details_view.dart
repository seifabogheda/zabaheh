import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/animal_details/widgets/build_animal_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/app_loader_helper.dart';
import '../../../core/utils/enums.dart';
import 'cubits/add_to_cart_cubit/add_to_cart_cubit.dart';

class AnimalDetailsView extends StatelessWidget {
  final String title;
  final int productId;
  const AnimalDetailsView({Key? key, required this.title, required this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AddToCartCubit>().productId = productId;
    return AuthCustomAppBar(
      title: title,
      needBack: true,
      scaffoldColor: ColorManager.offWhite,
      textColor: ColorManager.green,
      child: BuildAnimalBody(),
      bottomNavigationBar: Container(
        color: ColorManager.white,
        child: BlocBuilder<AddToCartCubit, AddToCartState>(
          builder: (context, state) {

            switch(state.addToCartRequestState){
              case RequestState.init:
                return CustomButton(title: 'أضف للسلة', onTap: () {
                  context.read<AddToCartCubit>().addToCart();
                },);
              case RequestState.loaded:
                // TODO: Handle this case.
                break;
              case RequestState.error:
                return CustomButton(title: 'أضف للسلة', onTap: () {
                  context.read<AddToCartCubit>().addToCart();
                },);
              case RequestState.loading:
                return Center(child: AppLoaderHelper.showSimpleLoading(),);
              default: return CustomButton(title: 'أضف للسلة', onTap: () {
                context.read<AddToCartCubit>().addToCart();
              },);
            }
            return CustomButton(title: 'أضف للسلة', onTap: () {
              context.read<AddToCartCubit>().addToCart();
            },);
          },
        ),
      ),
    );
  }
}

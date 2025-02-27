import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
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
  const AnimalDetailsView(
      {Key? key, required this.title, required this.productId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AddToCartCubit>().productId = productId;
    return AuthCustomAppBar(
      title: title,
      needBack: true,
      scaffoldColor: ColorManager.offWhite,
      textColor: ColorManager.black,
      child: BuildAnimalBody(),
      bottomNavigationBar: Container(
        color: ColorManager.white,
        margin: const EdgeInsets.all(10),
        child: BlocBuilder<AddToCartCubit, AddToCartState>(
            builder: (context, state) {
          return state.addToCartRequestState == RequestState.loading
              ? Center(
                  child: AppLoaderHelper.showSimpleLoading(),
                )
              : CustomButton(
                  title: tr(context, "addToCart"),
                  onTap: () {
                    context.read<AddToCartCubit>().addToCart();
                  },
                );
        }),
      ),
    );
  }
}

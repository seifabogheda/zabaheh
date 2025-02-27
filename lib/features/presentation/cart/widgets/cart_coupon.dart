import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_loader_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/utils/enums.dart';
import '../cubits/cart_cubit/cart_cubit.dart';

class CartCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartCubit = context.read<CartCubit>();
    return Container(
      // height: context.height * 0.14,
      width: context.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.selectedPaymentColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: CustomTextField(
              validator: (value) => value?.noValidate(),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.text,
              controller: cartCubit.couponController,
              hint: tr(context, "insertCoupon"),
            ),
          ),
          if (cartCubit.state.couponState == RequestState.init)
            Expanded(
              child: CustomButton(
                title: tr(context, "active"),
                onTap: () {
                  cartCubit.checkCoupon();
                },
                width: 80,
                height: 40,
                color: ColorManager.primary,
              ),
            ),
            if (cartCubit.state.couponState == RequestState.loading)
              AppLoaderHelper.showLoadingView(),
          if (cartCubit.state.couponState == RequestState.loaded)
            Expanded(
              child: CustomButton(
                title: tr(context, "active"),
                onTap: () {
                  // cartCubit.checkCoupon();
                },
                width: 80,
                height: 40,
                color: ColorManager.grey,
              ),
            ),
        ],
      ),
    );
  }
}

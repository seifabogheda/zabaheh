import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resource/color_manager.dart';

class CartCoupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cartCubit = context.read<CartCubit>();
    return Container(
      height: 100,
      width: context.width * 0.8,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.selectedPaymentColor,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AssetsManager.coupon,
            height: 25,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              child: CustomTextField(
                validator: (value) => value?.noValidate(),
                fieldTypes: FieldTypes.normal,
                type: TextInputType.text,
                controller: cartCubit.couponController,
                hint: tr(context, "insertCoupon"),
              )),
          if(cartCubit.state.couponState == RequestState.init)
            CustomButton(
              title: tr(context, "active"),
              onTap: () {
                cartCubit.checkCoupon();
              },
              width: 80,
              height: 35,
              color: ColorManager.green,
            ),
          if(cartCubit.state.couponState == RequestState.loading)
            AppLoaderHelper.showLoadingView(),
          if(cartCubit.state.couponState == RequestState.loaded)
            CustomButton(
              title: tr(context, "active"),
              onTap: () {},
              width: 80,
              height: 35,
              color: ColorManager.grey,
            ),
        ],
      ),
    );
  }
}

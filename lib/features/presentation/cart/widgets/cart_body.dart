import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/features/presentation/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:base_flutter/features/presentation/cart/cubits/coupon_cubit/coupon_cubit.dart';
import 'package:base_flutter/features/presentation/cart/widgets/cart_payment_way.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/enums.dart';
import 'cart_coupon.dart';
import 'cart_details.dart';
import 'cart_receive_order.dart';
import 'cart_summary.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CouponCubit(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartState == RequestState.loading)
            return Center(
              child: AppLoaderHelper.showSimpleLoading(),
            );
          if (state.cartState == RequestState.loaded)
            return ListView(
              children: [
                CartDetails(
                  cartModel: state.cartList,
                ),
                CartPaymentWay(),
                CartReceiveOrder(),
                CartCoupon(),
                CartSummary(),
                CustomButton(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  title: "تاكيد الطلب",
                  onTap: () {
                    context.read<CartCubit>().createOrder();
                  },
                  width: context.width * 0.8,
                  borderRadius: BorderRadius.circular(10),
                ),
              ],
            );
          return Center(
            child: MyText(
              title: "لا يوجد بيانات",
            ),
          );
        },
      ),
    );
  }
}

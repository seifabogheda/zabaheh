import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/models/all_cart_model.dart';
import 'package:base_flutter/features/presentation/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/helpers/snack_helper.dart';
import '../../../../core/resource/color_manager.dart';

class CartDetails extends StatelessWidget {
  final List<CartItems> cartModel;
  final GenericCubit<int> cartCountCubit = GenericCubit(0);

  final GenericCubit<num> cartPriceItem = GenericCubit(0);

  CartDetails({Key? key, required this.cartModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return Container(
      width: context.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: MyText(
                  title: "${tr(context, "orderDetails")}: ",
                  color: ColorManager.black,
                  size: 14,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (cartModel.isNotEmpty) {
                    cubit.deleteAllProducts();
                  } else {
                    SnackBarHelper.showBasicSnack(msg: "السلة خالية بالفعل");
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: MyText(
                    title: tr(context, "deleteCart"),
                    color: ColorManager.error,
                    size: 14,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Column(
            children: List.generate(cubit.state.cartList.length, (index) {
              cartCountCubit
                  .onUpdateData(cubit.state.cartList[index].quantity ?? 0);
              cartPriceItem.onUpdateData(
                  num.parse(cubit.state.cartList[index].totalPrice ?? ''));
              return Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: ColorManager.offWhite,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CachedImage(
                        url: cubit.state.cartList[index].variant?.product
                                ?.image ??
                            '',
                        borderRadius: BorderRadius.circular(15),
                        height: 60,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyText(
                                title: cubit.state.cartList[index].variant
                                        ?.product?.name ??
                                    '',
                                color: ColorManager.black,
                                size: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          BlocBuilder<GenericCubit<num>, GenericState<num>>(
                            bloc: cartPriceItem,
                            builder: (context, priceState) {
                              return MyText(
                                title:
                                    "${cubit.state.cartList[index].totalPrice} ${tr(context, 'sr')}  ",
                                color: ColorManager.primary,
                                size: 12,
                                fontWeight: FontWeight.w700,
                              );
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/features/models/all_cart_model.dart';
import 'package:base_flutter/features/presentation/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/helpers/snack_helper.dart';
import '../../../../core/resource/color_manager.dart';

class CartDetails extends StatelessWidget {
  final List<GetCartModel> cartModel;
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
                  title: "تفاصيل الطلب: ",
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
                    title: "حذف السلة",
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
              cartPriceItem
                  .onUpdateData(cubit.state.cartList[index].price ?? 0);
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
                        url: cubit.state.cartList[index].productId?.image ?? '',
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
                                title: cubit.state.cartList[index].productId
                                        ?.name ??
                                    '',
                                color: ColorManager.black,
                                size: 12,
                                fontWeight: FontWeight.w700,
                              ),
                              IconButton(
                                  onPressed: () {
                                    cubit.deleteProduct(
                                        cubit.state.cartList[index].productId
                                                ?.id ??
                                            0,
                                        index);
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: ColorManager.error,
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              BlocBuilder<GenericCubit<num>, GenericState<num>>(
                                bloc: cartPriceItem,
                                builder: (context, priceState) {
                                  return MyText(
                                    title:
                                        "${cubit.state.cartList[index].price} رس  ",
                                    color: ColorManager.primary,
                                    size: 12,
                                    fontWeight: FontWeight.w700,
                                  );
                                },
                              ),
                              Spacer(),
                              BlocBuilder<GenericCubit<int>, GenericState<int>>(
                                bloc: cartCountCubit,
                                builder: (context, counterState) {
                                  return Container(
                                    height: 40,
                                    width: 100,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: ColorManager.offWhite,
                                      borderRadius: BorderRadius.circular(5),
                                      border:
                                          Border.all(color: ColorManager.grey2),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            if (counterState.data > 1) {
                                              cartCountCubit.onUpdateData(
                                                  counterState.data - 1);

                                              cubit.updateCart(
                                                  cubit.state.cartList[index].id ??
                                                      0,
                                                  cartCountCubit.state.data,
                                                  index);
                                            }
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorManager.grey2),
                                              color: ColorManager.white,
                                            ),
                                            child: Icon(
                                              Icons.remove,
                                              color: ColorManager.grey,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                        MyText(
                                          title: cubit
                                              .state.cartList[index].quantity
                                              .toString(),
                                          size: 14,
                                          fontWeight: FontWeight.w600,
                                          color: ColorManager.black,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            cartCountCubit.onUpdateData(
                                                counterState.data + 1);
                                            cubit.updateCart(
                                                cubit.state.cartList[index].id  ??
                                                    0,
                                                cartCountCubit.state.data,
                                                index);
                                          },
                                          child: Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: ColorManager.grey2),
                                              color: ColorManager.green,
                                            ),
                                            child: Icon(
                                              Icons.add,
                                              color: ColorManager.white,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
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

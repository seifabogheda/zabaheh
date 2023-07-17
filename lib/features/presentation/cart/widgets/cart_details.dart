import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/features/models/all_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/helpers/app_loader_helper.dart';
import '../../../../core/helpers/snack_helper.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../repos/base_repo.dart';
import '../../../repos/repo_impl.dart';

class CartDetails extends StatefulWidget {
  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  BaseRepo repo = RepoImpl();
  final GenericCubit<List<GetCartModel>> cartItemsCubit = GenericCubit([]);
  final GenericCubit<int> cartCountCubit = GenericCubit(0);
  final GenericCubit<num> cartPriceItem = GenericCubit(0);

  getCartItems() async {
    var result = await repo.getAllCart();
    if (result != []) {
      cartItemsCubit.onUpdateData(result);
    }
  }

  deleteProduct(int id, int index) async {
    var data = await repo.deleteProductFromCart(id);
    if (data) {
      cartItemsCubit.state.data.removeAt(index);
      cartItemsCubit.onUpdateData(cartItemsCubit.state.data);
    }
  }

  updateCart(int id, int quantity) async {
    await repo.updateCart(id, quantity);
  }

  deleteAllProducts() async {
    var data = await repo.deleteAllProducts();
    if (data) {
      cartItemsCubit.onUpdateData([]);
    }
  }

  @override
  void initState() {
    super.initState();
    getCartItems();
  }

  @override
  Widget build(BuildContext context) {
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
                  if (cartItemsCubit.state.data.isNotEmpty) {
                    deleteAllProducts();
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
          BlocBuilder<GenericCubit<List<GetCartModel>>,
              GenericState<List<GetCartModel>>>(
            bloc: cartItemsCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return state.data.length != 0
                    ? Column(
                        children: List.generate(state.data.length, (index) {
                          cartCountCubit
                              .onUpdateData(state.data[index].quantity ?? 0);
                          cartPriceItem
                              .onUpdateData(state.data[index].price ?? 0);
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
                                    url: state.data[index].productId?.image ??
                                        '',
                                    borderRadius: BorderRadius.circular(15),
                                    height: 60,
                                    width: 50,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          MyText(
                                            title: state.data[index].productId
                                                    ?.name ??
                                                '',
                                            color: ColorManager.black,
                                            size: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                deleteProduct(
                                                    state.data[index].productId
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
                                          BlocBuilder<GenericCubit<num>,
                                              GenericState<num>>(
                                            bloc: cartPriceItem,
                                            builder: (context, priceState) {
                                              return MyText(
                                                title:
                                                    "${priceState.data} رس  ",
                                                color: ColorManager.primary,
                                                size: 12,
                                                fontWeight: FontWeight.w700,
                                              );
                                            },
                                          ),
                                          Spacer(),
                                          BlocBuilder<GenericCubit<int>,
                                              GenericState<int>>(
                                            bloc: cartCountCubit,
                                            builder: (context, counterState) {
                                              return Container(
                                                height: 40,
                                                width: 100,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                decoration: BoxDecoration(
                                                  color: ColorManager.offWhite,
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color:
                                                          ColorManager.grey2),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        if (counterState.data >
                                                            1) {
                                                          cartCountCubit
                                                              .onUpdateData(
                                                                  counterState
                                                                          .data -
                                                                      1);
                                                          var discountValue = state
                                                                  .data[index]
                                                                  .productId!
                                                                  .mainPrice! -
                                                              state
                                                                  .data[index]
                                                                  .productId!
                                                                  .discountPrice!;
                                                          var result = state
                                                                  .data[index]
                                                                  .productId!
                                                                  .mainPrice! -
                                                              discountValue;
                                                          cartPriceItem
                                                              .onUpdateData(result *
                                                                  cartCountCubit
                                                                      .state
                                                                      .data);
                                                          updateCart(
                                                              state
                                                                      .data[
                                                                          index]
                                                                      .productId
                                                                      ?.id ??
                                                                  0,
                                                              counterState
                                                                  .data);
                                                        }
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color:
                                                                  ColorManager
                                                                      .grey2),
                                                          color: ColorManager
                                                              .white,
                                                        ),
                                                        child: Icon(
                                                          Icons.remove,
                                                          color:
                                                              ColorManager.grey,
                                                          size: 20,
                                                        ),
                                                      ),
                                                    ),
                                                    MyText(
                                                      title: counterState.data
                                                          .toString(),
                                                      size: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: ColorManager.black,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        cartCountCubit
                                                            .onUpdateData(
                                                                counterState
                                                                        .data +
                                                                    1);
                                                        var discountValue = state
                                                                .data[index]
                                                                .productId!
                                                                .mainPrice! -
                                                            state
                                                                .data[index]
                                                                .productId!
                                                                .discountPrice!;
                                                        var result = state
                                                                .data[index]
                                                                .productId!
                                                                .mainPrice! -
                                                            discountValue;
                                                        cartPriceItem
                                                            .onUpdateData(result *
                                                                cartCountCubit
                                                                    .state
                                                                    .data);
                                                        updateCart(
                                                            state
                                                                    .data[index]
                                                                    .productId
                                                                    ?.id ??
                                                                0,
                                                            counterState.data);
                                                      },
                                                      child: Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          border: Border.all(
                                                              color:
                                                                  ColorManager
                                                                      .grey2),
                                                          color: ColorManager
                                                              .green,
                                                        ),
                                                        child: Icon(
                                                          Icons.add,
                                                          color: ColorManager
                                                              .white,
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
                      )
                    : Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyText(
                            title: "السلة خالية",
                          ),
                        ),
                      );
              } else {
                return Center(
                  child: AppLoaderHelper.showSimpleLoading(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

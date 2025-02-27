import 'dart:developer';

import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/city_model.dart';
import 'package:base_flutter/features/models/coupon_response_model.dart';
import 'package:base_flutter/features/models/create_order_model.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:base_flutter/features/repos/repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../models/all_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController couponController = TextEditingController();

  Future<void> close() {
    dateController.dispose();
    notesController.dispose();
    return super.close();
  }

  BaseRepo repo = RepoImpl();
  CityModel? selectedCity;
  CouponResponseModel? coupon;
  int? selectedReceivePlaceOrder = 0;
  int? selectedReceiveTimeOrder = 1;
  num deliveryPrice = 0;
  num finalTotalPrice = 0;
  getCart() async {
    emit(state.copyWith(cartState: RequestState.loading));
    var result = await repo.getAllCart();
    if (result != null) {
      deliveryPrice = result.deliveryFee ?? 0;
      finalTotalPrice = result.totalOrderPrice ?? 0 + deliveryPrice;
      emit(
        state.copyWith(
          deliveryFee: deliveryPrice,
          cartState: RequestState.loaded,
          cartList: result.cartItems,
          cartPrice: result.totalOrderPrice,
          cartPriceAfterCoupon: finalTotalPrice,
        ),
      );
      culTotalPrice();
    } else {
      emit(state.copyWith(cartState: RequestState.error, cartList: []));
    }
  }

  deleteProduct(int id, int index) async {
    await repo.deleteProductFromCart(id);
    // num totalPrice = state.cartList.fold(0, (num prev, e) => prev + e.price!);
    // num productPrice = state.cartList[index].price ?? 0;
    // num newTotalPrice = totalPrice - productPrice;
    emit(state.copyWith(
        cartState: RequestState.loading, cartList: state.cartList));
    log("state 1 : ${state.cartList.length}");
    state.cartList.removeAt(index);
    emit(state.copyWith(
        cartState: RequestState.loaded, cartList: state.cartList));
    log("state 2 : ${state.cartList.length}");

    // cart.state.data.removeAt(index);
    // cartItemsCubit.onUpdateData(cartItemsCubit.state.data);
  }

  deleteAllProducts() async {
    var data = await repo.deleteAllProducts();
    if (data) {
      emit(state.copyWith(cartList: []));
    }
  }

  checkCoupon() async {
    if (couponController.text.isNotEmpty) {
      emit(state.copyWith(couponState: RequestState.loading));
      coupon = await repo.checkCoupon(couponController.text);
      if (coupon != '') {
        emit(state.copyWith(couponState: RequestState.loaded));
        emit(state.copyWith(
            cartPriceAfterCoupon:
                num.parse(coupon?.finalTotalPrice.toString() ?? ''),
            cartState: RequestState.loading));
        emit(state.copyWith(
            cartPriceAfterCoupon:
                num.parse(coupon?.finalTotalPrice.toString() ?? ''),
            cartState: RequestState.loaded));
        couponController.clear();
        culTotalPrice();
      } else {
        emit(state.copyWith(couponState: RequestState.init));
      }
    } else {
      SnackBarHelper.showBasicSnack(msg: "يجب كتابة كود الخصم اولا");
    }
  }

  culTotalPrice() {
    if (coupon != null) {
      num vat = state.cartPriceAfterCoupon * 0.15;
      finalTotalPrice = state.cartPriceAfterCoupon + deliveryPrice! + vat;
      emit(state.copyWith(
          cartPriceAfterCoupon: finalTotalPrice,
          cartState: RequestState.loading));
      emit(
        state.copyWith(
            cartPriceAfterCoupon: finalTotalPrice,
            cartState: RequestState.loaded),
      );
    } else {
      num vat = state.cartPrice * 0.15;
      finalTotalPrice = state.cartPrice + deliveryPrice + vat;
      emit(state.copyWith(
          cartPriceAfterCoupon: finalTotalPrice,
          cartState: RequestState.loading));
      emit(
        state.copyWith(
            cartPriceAfterCoupon: finalTotalPrice,
            cartState: RequestState.loaded),
      );
    }
  }

  createOrder() async {
    if (selectedReceivePlaceOrder == 0) {
      log("Here M $selectedReceivePlaceOrder");
      if (formKey.currentState!.validate()) {
        CreateOrderModel model = CreateOrderModel(
          notes: notesController.text,
          shippingAddress: dateController.text,
        );
        await repo.createOrder(model);
      }
    } else {
      log("Here, $selectedReceivePlaceOrder");
      CreateOrderModel model = CreateOrderModel(
        shippingAddress:  "استلام من الفرع",
        notes: "",
      );
      await repo.createOrder(model);
    }
  }
}

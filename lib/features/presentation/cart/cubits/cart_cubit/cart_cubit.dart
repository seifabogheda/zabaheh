import 'dart:developer';

import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/city_model.dart';
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
  String? coupon;
  int? selectedReceivePlaceOrder = 0;
  int? selectedReceiveTimeOrder = 1;
  getCart() async {
    emit(state.copyWith(cartState: RequestState.loading));

    var result = await repo.getAllCart();
    if (result.isNotEmpty) {
      num totalPrice = result.fold(0, (num prev, e) => prev + e.price!);
      num productPrice = result.fold(0, (num prev, e) => prev + e.price!);
      // print("message id  : ${state.cartList[0].id}" );
      emit(state.copyWith(
          cartState: RequestState.loaded,
          cartList: result,
          cartPrice: totalPrice,
          productPrice: productPrice));
      log("done");

    } else {
      log("errorCart");
      emit(state.copyWith(cartState: RequestState.error, cartList: []));
    }
  }

  updateCart(int id, int quantity, int index) async {
    var discount = state.cartList[index].productId?.discountPrice ?? 0;
    var mainPrice = state.cartList[index].productId?.mainPrice ?? 0;
    log("discount : $discount");
    log("mainPrice : $mainPrice");

    var discountVal =
        mainPrice - discount;
    log("discountVal : $discountVal");
    log("discount : $discount");
    var result = mainPrice - discountVal;
    log("result : $result");

    var finalResult = result * quantity;
    log("finalResult : $finalResult");

    state.cartList[index].price = finalResult;
    state.cartList[index].quantity = quantity;
    num totalPrice = state.cartList.fold(0, (num prev, e) => prev + e.price!);

    emit(state.copyWith(
        cartState: RequestState.loading, cartList: state.cartList,productPrice: totalPrice,cartPrice: totalPrice));
    emit(state.copyWith(
        cartState: RequestState.loaded, cartList: state.cartList,productPrice: totalPrice,cartPrice: totalPrice));
    await repo.updateCart(id, quantity);
  }

  deleteProduct(int id, int index) async {
    await repo.deleteProductFromCart(id);
    num totalPrice = state.cartList.fold(0, (num prev, e) => prev + e.price!);
    num productPrice = state.cartList[index].price ?? 0;
    num newTotalPrice = totalPrice - productPrice;
    emit(state.copyWith(
        cartState: RequestState.loading, cartList: state.cartList,cartPrice: newTotalPrice,productPrice: newTotalPrice));
    log("state 1 : ${state.cartList.length}");
    state.cartList.removeAt(index);
    emit(state.copyWith(
        cartState: RequestState.loaded, cartList: state.cartList,cartPrice: newTotalPrice,productPrice: newTotalPrice));
    log("state 2 : ${state.cartList.length}");

    // cart.state.data.removeAt(index);
    // cartItemsCubit.onUpdateData(cartItemsCubit.state.data);
  }

  deleteAllProducts() async {
    var data = await repo.deleteAllProducts();
    if (data) {
      emit(state.copyWith(cartList: [],cartPrice: 0,productPrice: 0
      ));
    }
  }
  checkCoupon() async {
   if(couponController.text.isNotEmpty){
     emit(state.copyWith(couponState: RequestState.loading));
     coupon = await repo.checkCoupon(couponController.text);
     if (coupon != '') {
       emit(state.copyWith(couponState: RequestState.loaded));
       num result = state.cartPrice - 10;
       log("result price :$result");
       print("result price :$result");
       emit(state.copyWith(cartPrice: result,cartState: RequestState.loading));
       emit(state.copyWith(cartPrice: result,cartState: RequestState.loaded));
     } else {
       emit(state.copyWith(couponState: RequestState.init));
     }
   }else{
     SnackBarHelper.showBasicSnack(msg: "يجب كتابة كود الخصم اولا");
   }
  }
  createOrder() async {
    CreateOrderModel model = CreateOrderModel(
      deliveryDate: dateController.text,
      deliveryTimeId: selectedReceiveTimeOrder,
      deliveryType: selectedReceivePlaceOrder == 0 ? 'shipping' : 'shop',
      address: selectedCity?.nameAr,
      cityId: selectedCity?.id ?? 0,
      note: notesController.text,
      coupon: coupon,
    );
    await repo.createOrder(model);
  }
}

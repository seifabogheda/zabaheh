import 'dart:developer';

import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/utils/enums.dart';
import '../../../../models/add_to_cart_model.dart';
import '../../../../repos/base_repo.dart';
import '../../../../repos/repo_impl.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartState());
  static AddToCartCubit get(context) => BlocProvider.of(context);

  BaseRepo cartRepo = RepoImpl();
  List<OptionsCart>? options = [];
  int? quantity;
  int? productId;
  int? variantId;
  addToCart() async {
    Set<OptionsCart> setOptions = Set.from(options!);
    options = setOptions.toList();
    emit(state.copyWith(
        addToCartRequestState: RequestState.loading, addToCartMessage: ''));
    var result = await cartRepo.addToCart(AddToCartModel(
        variantId: variantId,
        productId: productId,
        options: options,
        quantity: quantity));
    if (result) {
      emit(
        state.copyWith(
            addToCartRequestState: RequestState.loaded,
            addToCartMessage: tr(navigatorKey.currentContext!,"addedToCart")),
      );
      options?.clear();
    } else {
      emit(
        state.copyWith(
            addToCartRequestState: RequestState.error,
            addToCartMessage: tr(navigatorKey.currentContext!,"someThingWrong")),
      );
    }
  }

  addOption(OptionsCart option) {
    if (options!.where((o) => o.optionId == option.optionId).isNotEmpty ||
        options!.where((e) => e.type == option.type).isNotEmpty) {
      log("contain");
      updateOption(option);
    } else {
      log("add");
      options?.add(option);
    }
  }

  void updateOption(OptionsCart optionCart) {
    final index = options?.indexWhere((o) => o.type == optionCart.type);
    if (index != -1) {
      final updated = options![index!];
      updated.quantity = optionCart.quantity;
      updated.optionId = optionCart.optionId;
      updated.type = optionCart.type;
    }
  }
}

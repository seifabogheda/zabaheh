import 'dart:developer';

import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/product_model.dart';
import '../../../../repos/repo_impl.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  BaseRepo repoImpl = RepoImpl();
  Map<String, List<Options>> groupedOptions = {};
  getProductDetails(int id) async {
    emit(ProductDetailsLoading());
    var result = await repoImpl.productDetails(id);
    if (result != null) {
      log("result is : ${result.name}");
      emit(ProductDetailsSuccess(result));
      for (var option in result.options!) {
        if (groupedOptions.containsKey(option.type)) {
          groupedOptions[option.type]!.add(option);
        } else {
          groupedOptions[option.type!] = [option];
        }
      }
    } else {
      emit(ProductDetailsFailed());
    }
  }
}

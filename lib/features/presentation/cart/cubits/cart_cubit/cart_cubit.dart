import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:base_flutter/features/repos/repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/all_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  
  BaseRepo repo = RepoImpl();

  getCart() async{
    emit(CartLoading());
    var result = await repo.getAllCart();
    if(result.isNotEmpty){
      emit(CartSuccess(result));
    }
    else{
      emit(CartFailed());
    }
  }


}

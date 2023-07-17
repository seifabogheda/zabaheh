import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../models/add_to_cart_model.dart';
import '../../../../repos/base_repo.dart';
import '../../../../repos/repo_impl.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit() : super(AddToCartState());
  static AddToCartCubit get(context) => BlocProvider.of(context);

  BaseRepo cartRepo = RepoImpl();
  List<int>? options = [];
  int? quantity;
  int? productId;
  addToCart() async{
    emit(state.copyWith(addToCartRequestState: RequestState.loading,addToCartMessage: ''));
    var result = await cartRepo.addToCart(AddToCartModel(productId: productId,options: options,quantity: quantity));
    if(result){
      emit(state.copyWith(addToCartRequestState: RequestState.loaded,addToCartMessage: 'تم اضافة طلبك بنجاح'),);
      options?.clear();
    }
    else{
      emit(state.copyWith(addToCartRequestState: RequestState.error,addToCartMessage: 'يبدو هناك مشكلة ما حاول مرة اخرى'));

    }
  }
}

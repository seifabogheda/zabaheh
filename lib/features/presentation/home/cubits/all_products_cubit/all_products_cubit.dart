import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../models/product_model.dart';
import '../../../../repos/repo_impl.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit() : super(AllProductsInitial());
  static AllProductsCubit get(context) => BlocProvider.of(context);
  BaseRepo repo = RepoImpl();
  getAllProducts(int categoryId) async{
    emit(AllProductsLoading());
    var result = await repo.allProducts(categoryId);
    if(result.isNotEmpty){
      emit(AllProductsSuccess(result));
    }else{
      emit(AllProductsFailed());
    }
  }
}

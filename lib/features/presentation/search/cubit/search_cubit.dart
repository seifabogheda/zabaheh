import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:base_flutter/features/repos/repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());
  final TextEditingController searchController = TextEditingController();
  BaseRepo repo = RepoImpl();
  Future<void> close(){
    searchController.dispose();
    return super.close();
  }

  search() async{
    if(searchController.text.isNotEmpty){
      if(searchController.text.length > 3){
        emit(state.copyWith(searchState: RequestState.loading));
        var data = await repo.search(searchController.text);
        if(data.isNotEmpty){
          emit(state.copyWith(searchState: RequestState.loaded,products: data));
        }else{
          emit(state.copyWith(searchState: RequestState.init,products: []));
        }
      }
    }else{
      SnackBarHelper.showBasicSnack(msg: "اكتب اسم المنتج التي تريد البحث عنه");
    }

  }
}

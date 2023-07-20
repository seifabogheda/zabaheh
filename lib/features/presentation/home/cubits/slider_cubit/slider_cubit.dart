import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:base_flutter/features/repos/repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/slider_model.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderState());

  BaseRepo repo = RepoImpl();

  getSlider() async{
    emit(state.copyWith(sliderState: RequestState.loading));
    var data = await repo.slider();
    if(data.isNotEmpty){
      emit(state.copyWith(sliderList: data ,sliderState: RequestState.loaded));
    }else{
      emit(state.copyWith(sliderList: [],sliderState: RequestState.init));
    }
  }
}

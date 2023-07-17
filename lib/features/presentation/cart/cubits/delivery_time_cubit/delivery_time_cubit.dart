import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/time_model.dart';
import '../../../../repos/base_repo.dart';
import '../../../../repos/repo_impl.dart';

part 'delivery_time_state.dart';

class DeliveryTimeCubit extends Cubit<DeliveryTimeState> {
  DeliveryTimeCubit() : super(DeliveryTimeInitial());

  BaseRepo repo = RepoImpl();


  getDeliveryTime() async{
    emit(DeliveryTimeLoading());
    var timeList = await repo.timeList();
    if(timeList.isNotEmpty){
      emit(DeliveryTimeSuccess(timeList));
    }else{
      emit(DeliveryTimeError());
    }
  }
}

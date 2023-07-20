import 'dart:developer';

import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/orders_model.dart';
import '../../../repos/repo_impl.dart';

part 'current_orders_state.dart';

class CurrentOrdersCubit extends Cubit<CurrentOrdersState> {
  CurrentOrdersCubit() : super(CurrentOrdersInitial());

  int page = 1;

  BaseRepo orderRepo = RepoImpl();
  getCurrentOrders() async {
    emit(CurrentOrdersLoading());
    var data = await orderRepo.currentOrders(page);
    if (data!.orderData?.length != 0 && data.nextPageUrl != null) {
      emit(CurrentOrdersSuccess(data));
      log("data is ${data.orderData?.first.id}");
      page++;
    } else if (data.nextPageUrl == null) {
      emit(CurrentOrdersSuccess(data));
      log("data is ${data.orderData?.first.id}");
    } else {
      emit(CurrentOrdersFailed());
    }
  }
  getCompletedOrders() async {
    emit(CurrentOrdersLoading());
    var data = await orderRepo.completedOrders(page);
    if (data!.orderData?.length != 0 && data.nextPageUrl != null) {
      emit(CurrentOrdersSuccess(data));
      log("data is 0 ${data.orderData?.first.id}");
      page++;
    } else if (data.nextPageUrl == null) {
      emit(CurrentOrdersSuccess(data));
      log("data is ${data.orderData?.length}");
    } else {
      emit(CurrentOrdersFailed());
    }
  }
}

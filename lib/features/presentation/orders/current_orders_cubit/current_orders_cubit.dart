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
  List<Data> currentOrders = [];
  BaseRepo orderRepo = RepoImpl();
  getCurrentOrders() async {
    emit(CurrentOrdersLoading());
    var data = await orderRepo.currentOrders();
    if (data != null) {
      if (data.data?.length != 0 && data.links?.next != null) {
        currentOrders.addAll(
            data.data?.where((element) => element.status != 'Delivered') ?? []);

        emit(CurrentOrdersSuccess(currentOrders));
        page++;
      } else if (data.links?.next == null) {
        log("testDev");
        data.data?.forEach((element) {
          if (element.status != 'Delivered') {
            currentOrders.add(element);
          }else{
            null;
          }
        });


        emit(CurrentOrdersSuccess(currentOrders));
      } else {
        emit(CurrentOrdersFailed());
      }
    } else {
      emit(CurrentOrdersFailed());
    }
  }

  getCompletedOrders() async {
    emit(CurrentOrdersLoading());
    var data = await orderRepo.completedOrders(page);
    if (data != null) {
      if (data.data?.length != 0 && data.links?.next != null) {
        emit(CurrentOrdersSuccess(data.data ?? []));
        page++;
      } else if (data.links?.next == null) {
        emit(CurrentOrdersSuccess(data.data ?? []));
      } else {
        emit(CurrentOrdersFailed());
      }
    } else {
      emit(CurrentOrdersFailed());
    }
  }
}

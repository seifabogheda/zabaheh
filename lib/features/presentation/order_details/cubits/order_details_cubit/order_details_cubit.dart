import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/models/order_details_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../repos/base_repo.dart';
import '../../../../repos/repo_impl.dart';
import '../../../main_navigation_bar/main_navigation_bar.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsState());
  BaseRepo orderDetailsRepo = RepoImpl();
  orderDetails(int id) async {
    emit(state.copyWith(orderDetailsState: RequestState.loading));
    var result = await orderDetailsRepo.orderDetails(id);
    if (result != null) {
      emit(
        state.copyWith(
          orderDetailsState: RequestState.loaded,
          orderDetailsModel: result,
        ),
      );
    } else {
      emit(state.copyWith(
        orderDetailsState: RequestState.error,
      ));
    }
  }

  cancelOrder(int orderId, String reason) async {
    SnackBarHelper.showBasicSnack(msg: "جاري حذف الطلب");
    await orderDetailsRepo.cancelOrder(orderId, reason);
    NavigationService.removeUntil(MainNavigationBar());
  }
  reviewOrder(int orderId,num rate ,String comment) async {
    SnackBarHelper.showBasicSnack(msg: "جاري اسال التقييم");
    await orderDetailsRepo.orderReview(orderId, rate ,comment);
  }
}

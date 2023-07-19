part of 'order_details_cubit.dart';

class OrderDetailsState extends Equatable {
  final RequestState orderDetailsState;
  final OrderDetailsModel? orderDetailsModel;
  const OrderDetailsState({
    this.orderDetailsState = RequestState.loading,
    this.orderDetailsModel,
  });
  OrderDetailsState copyWith(
      {RequestState? orderDetailsState, OrderDetailsModel? orderDetailsModel}) {
    return OrderDetailsState(
      orderDetailsModel: orderDetailsModel ?? this.orderDetailsModel,
      orderDetailsState: orderDetailsState ?? this.orderDetailsState,
    );
  }

  @override
  List<Object> get props => [orderDetailsState];
}

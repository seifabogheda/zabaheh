part of 'current_orders_cubit.dart';

abstract class CurrentOrdersState extends Equatable {
  const CurrentOrdersState();
  @override
  List<Object> get props => [];
}

class CurrentOrdersInitial extends CurrentOrdersState {}
class CurrentOrdersLoading extends CurrentOrdersState {}
class CurrentOrdersSuccess extends CurrentOrdersState {
  final OrdersModel ordersModel;

  CurrentOrdersSuccess(this.ordersModel);
  @override
  List<Object> get props => [ordersModel];
}
class CurrentOrdersFailed extends CurrentOrdersState {}
class CompletedOrdersInitial extends CurrentOrdersState {}
class CompletedOrdersLoading extends CurrentOrdersState {}
class CompletedOrdersSuccess extends CurrentOrdersState {
  final OrdersModel ordersModel;

  CompletedOrdersSuccess(this.ordersModel);
  @override
  List<Object> get props => [ordersModel];
}
class CompletedOrdersFailed extends CurrentOrdersState {}
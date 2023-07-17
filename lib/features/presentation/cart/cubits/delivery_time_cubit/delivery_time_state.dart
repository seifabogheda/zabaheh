part of 'delivery_time_cubit.dart';

abstract class DeliveryTimeState extends Equatable {
  const DeliveryTimeState();
  @override
  List<Object> get props => [];
}

class DeliveryTimeInitial extends DeliveryTimeState {}
class DeliveryTimeLoading extends DeliveryTimeState {}
class DeliveryTimeSuccess extends DeliveryTimeState {
  final List<TimeModel> timeList;

  DeliveryTimeSuccess(this.timeList);
  @override
  List<Object> get props => [timeList];
}
class DeliveryTimeError extends DeliveryTimeState {}

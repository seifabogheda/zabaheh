part of 'coupon_cubit.dart';

abstract class CouponState extends Equatable {
  const CouponState();
  @override
  List<Object> get props => [];
}

class CouponInitial extends CouponState {}
class CouponLoading extends CouponState {}
class CouponSuccess extends CouponState {}
class CouponFailed extends CouponState {}

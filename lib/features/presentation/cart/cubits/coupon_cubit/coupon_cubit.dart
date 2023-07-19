import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:base_flutter/features/repos/repo_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'coupon_state.dart';

class CouponCubit extends Cubit<CouponState> {
  CouponCubit() : super(CouponInitial());
  static CouponCubit get(context) => BlocProvider.of(context);
  TextEditingController couponController = TextEditingController();
  String? coupon = '';
  BaseRepo repo = RepoImpl();
  @override
  Future<void> close() {
    couponController.dispose();
    return super.close();
  }

  checkCoupon() async {
    emit(CouponLoading());
    coupon = await repo.checkCoupon(couponController.text);
    if (coupon != '') {
      emit(CouponSuccess());
    } else {
      emit(CouponInitial());
    }
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../repos/auth_repo_impl.dart';
import '../../../../repos/base_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit() : super(ForgetPasswordInitial());
  static ForgetPasswordCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  BaseRepo authRepo = AuthRepoImpl();

  void checkPhoneNumber() async {
    if (formKey.currentState!.validate()) {
      String phone = '+966${phoneController.text}';
      emit(ForgetPasswordLoading());
      var result = await authRepo.forgetPassword(phone: phone);
      if (result) {
        emit(ForgetPasswordSuccess());
      }else{
        emit(ForgetPasswordInitial());
      }
    }
  }
}

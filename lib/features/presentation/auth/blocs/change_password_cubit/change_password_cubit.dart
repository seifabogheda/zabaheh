import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/repos/auth_repo_impl.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  static ChangePasswordCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    oldPassController.dispose();
    newPassController.dispose();
    confirmNewPassController.dispose();
    return super.close();
  }

  GlobalKey<FormState> changePasswordFormKey = GlobalKey<FormState>();
  TextEditingController oldPassController = TextEditingController();
  TextEditingController newPassController = TextEditingController();
  TextEditingController confirmNewPassController = TextEditingController();
  BaseRepo authRepo = AuthRepoImpl();
  void changePassword() async{
    if (changePasswordFormKey.currentState!.validate()) {
      emit(ChangePasswordLoading());
      var result = await authRepo.updatePassword(oldPassController.text, newPassController.text,confirmNewPassController.text);
      if(result){
        SnackBarHelper.showBasicSnack(msg: "تم تغيير كلمة المرور بنجاح",color: ColorManager.green);
        emit(ChangePasswordSuccess());
      }
    } else {
      emit(ChangePasswordFailed("يجب اكمال جميع البيانات"));
    }
  }
}

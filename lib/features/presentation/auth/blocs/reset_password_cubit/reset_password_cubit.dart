import 'package:base_flutter/features/repos/repo_impl.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());
  static ResetPasswordCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    code.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController code = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmNewPasswordController = TextEditingController();
  BaseRepo authRepo = RepoImpl();
  void resetPassword() async {
    if (formKey.currentState!.validate()) {
      emit(ResetPasswordLoading());
      var result = await authRepo.resetPassword(
        code.text,
        newPasswordController.text,
        confirmNewPasswordController.text,
      );
      if (result) {
        emit(ResetPasswordSuccess());
      } else {
        emit(ResetPasswordInitial());
      }
    }
  }
}

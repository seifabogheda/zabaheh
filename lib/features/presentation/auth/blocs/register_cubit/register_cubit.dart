
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/register_model.dart';
import '../../../../repos/repo_impl.dart';
import '../../../../repos/base_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  Future<void> close() {
    firstNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    lastNameController.dispose();
    address.dispose();
    return super.close();
  }

  getPhone(String phone){
    phoneController.text = phone;
  }
  BaseRepo authRepo = RepoImpl();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController emailController = TextEditingController();


  void register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String phone = "${phoneController.text}";
      RegisterModel model = RegisterModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: emailController.text,
          phone: phone,
          address: address.text);
      emit(RegisterLoading());
      var result = await authRepo.register(model);
      if (result) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterInitial());
      }
    }
  }
}

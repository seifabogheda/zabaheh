import 'package:base_flutter/core/localization/lang_cubit/lang_cubit.dart';
import 'package:dropdown_search/dropdown_search.dart';
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
    phoneController.dispose();
    passwordController.dispose();
    emailController.dispose();
    lastNameController.dispose();
    firstNameController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
  BaseRepo authRepo = RepoImpl();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  final GlobalKey<DropdownSearchState> cityKey = GlobalKey();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void register(BuildContext context) async {
    // var deviceId = await _firebaseMessaging.getToken();
    if (formKey.currentState!.validate()) {
      String phone = "+966${phoneController.text}";
      RegisterModel model = RegisterModel(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          lang: context.read<LangCubit>().state.locale.languageCode,
          email: emailController.text,
          cityId: 1,
          phone: phone,
          password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
      );
      emit(RegisterLoading());
      var result = await authRepo.register(model);
      if (result) {
        emit(RegisterSuccess());
      } else {
        emit(RegisterInitial());
      }
    } else {
      emit(RegisterFailed("يجب اكمال جميع البيانات"));
    }
    // SnackBarHelper.showBasicSnack(msg: "",color: ColorManager.error);
  }
}

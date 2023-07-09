import 'package:base_flutter/core/localization/lang_cubit/lang_cubit.dart';
import 'package:base_flutter/features/models/update_profile_model.dart';
import 'package:base_flutter/features/repos/auth_repo_impl.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resource/navigation_service.dart';
import '../user_cubit/user_cubit.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial());
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  @override
  Future<void> close() {
    phoneController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    return super.close();
  }
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var user = navigatorKey.currentContext!.read<UserCubit>().state.model;
  TextEditingController phoneController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  BaseRepo authRepo = AuthRepoImpl();
  getProfileData(){
    phoneController.text = user.phone ?? '';
    firstNameController.text = user.firstName ?? '';
    lastNameController.text = user.lastName ?? '';
    emailController.text = user.email ?? '';
  }
  void updateProfile() async{
    if (formKey.currentState!.validate()) {
      emit(UpdateProfileLoading());
      UpdateProfileModel model = UpdateProfileModel(
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        email: emailController.text,
        phone: phoneController.text,
        cityId: 1,
        lang: navigatorKey.currentContext!.read<LangCubit>().state.locale.languageCode,
      );
      var result = await authRepo.updateProfile(model);
      if(result){
        emit(UpdateProfileSuccess());
      }
    } else {
      emit(UpdateProfileInitial());
      emit(UpdateProfileFailed("يجب اكمال جميع البيانات"));
    }
  }
}

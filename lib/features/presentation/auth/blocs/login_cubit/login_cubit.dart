import 'package:base_flutter/core/helpers/snack_helper.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/localization/app_localizations.dart';
import '../../../../../core/resource/navigation_service.dart';
import '../../../../repos/auth_repo_impl.dart';
import '../../../../repos/base_repo.dart';
import '../../../main_navigation_bar/cubits/main_navigation_cubit.dart';
import '../../../main_navigation_bar/main_navigation_bar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  @override
  Future<void> close() {
    phoneController.dispose();
    passwordController.dispose();
    return super.close();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  BaseRepo authRepo = AuthRepoImpl();

  login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      String phone = "+966${phoneController.text}";
      emit(LoginLoading());
      var result =
          await authRepo.login(phone, passwordController.text);
      if (result) {
        NavigationService.removeUntil(BlocProvider(
          create: (context) => BottomNavCubit(),
          child: MainNavigationBar(),
        ));
        SnackBarHelper.showBasicSnack(msg: tr(context, "loginDone"));

        emit(LoginSuccess());
      } else {
        emit(LoginInitial());
        SnackBarHelper.showBasicSnack(msg: tr(context, "someThingWrong"));
      }
    }
  }
}

import 'package:base_flutter/features/models/home_model.dart';
import 'package:base_flutter/features/models/update_profile_model.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';

import '../../core/api_service/DioImports.dart';
import '../../core/helpers/snack_helper.dart';
import '../../core/resource/app_strings_manager.dart';
import '../../core/resource/navigation_service.dart';
import '../../core/utils/utils_imports.dart';
import '../models/option_model.dart';
import '../models/product_model.dart';
import '../models/register_model.dart';
import '../presentation/auth/screens/reset_password/reset_password_view.dart';
import 'base_repo.dart';

class RepoImpl extends BaseRepo {
  @override
  Future<bool> login(String phone, String password) async {
    Map<String, dynamic> body = {
      "phone": phone,
      "password": password,
    };
    var data = await DioHelper().post(url: AppStringsManager.login, body: body);
    if (data["user"] != null) {
      Utils.manipulateLoginData(data["user"], data['access_token']);
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data['error']);
      return false;
    }
  }

  Future<bool> forgetPassword({required String phone}) async {
    Map<String, dynamic> body = {
      "phone": phone,
    };
    var data =
        await DioHelper().post(url: AppStringsManager.forget, body: body);
    if (data["data"] == null) {
      NavigationService.navigateTo(ResetPasswordView());
      SnackBarHelper.showBasicSnack(msg: data['message']);
      return true;
    } else {
      return false;
    }
  }

  Future<bool> register(RegisterModel model) async {
    var data = await DioHelper().post(
      url: AppStringsManager.register,
      body: model.toJson(),
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      NavigationService.removeUntil(LoginView());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> logout() async {
    var data = await DioHelper().post(
      url: AppStringsManager.logout,
      body: {},
    );
    if (data != null) {
      Utils.clearSavedData();
      SnackBarHelper.showBasicSnack(msg: data['message']);
      NavigationService.removeUntil(LoginView());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetPassword(
      String code, String password, String passwordConfirmation) async {
    Map<String, dynamic> body = {
      "code": code,
      "password": password,
      'password_confirmation': passwordConfirmation
    };
    var data = await DioHelper()
        .post(url: AppStringsManager.resetPassword, body: body);
    if (data != null) {
      NavigationService.navigateAndReplacement(LoginView());
      SnackBarHelper.showBasicSnack(msg: data['message']);
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      return false;
    }
  }

  Future<bool> updateProfile(UpdateProfileModel model) async {
    var data = await DioHelper().post(
      url: AppStringsManager.updateProfile,
      body: model.toJson(),
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      NavigationService.removeUntil(LoginView());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updatePassword(
      String oldPassword, String newPassword, String confirmNewPassword) async {
    Map<String, dynamic> body = {
      "old_password": oldPassword,
      "new_password": newPassword,
      "new_password_confirmation": confirmNewPassword,
    };
    var data = await DioHelper()
        .post(url: AppStringsManager.changePassword, body: body);
    if (data != null) {
      NavigationService.back();
      SnackBarHelper.showBasicSnack(msg: data['message']);
      return true;
    } else {
      return false;
    }
  }

  Future<List<HomeModel>> home() async {
    var data = await DioHelper().get(
      url: AppStringsManager.home,
    );
    if (data != null) {
      return List<HomeModel>.from(
          data["data"].map((e) => HomeModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<Products?> productDetails(int id) async{
    var data = await DioHelper().get(
      url: AppStringsManager.productDetails + "$id",
    );
    if (data != null) {
      return Products.fromJson(data["data"]);
    } else {
      return null;
    }
  }
  Future<List<OptionModel>> options() async {
    var data = await DioHelper().get(
      url: AppStringsManager.options,
    );
    if (data != null) {
      return List<OptionModel>.from(
          data["data"].map((e) => OptionModel.fromJson(e)));
    } else {
      return [];
    }
  }
}

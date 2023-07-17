import 'dart:developer';

import 'package:base_flutter/features/models/home_model.dart';
import 'package:base_flutter/features/models/update_profile_model.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../core/api_service/DioImports.dart';
import '../../core/helpers/snack_helper.dart';
import '../../core/resource/app_strings_manager.dart';
import '../../core/resource/navigation_service.dart';
import '../../core/utils/utils_imports.dart';
import '../models/add_to_cart_model.dart';
import '../models/all_cart_model.dart';
import '../models/city_model.dart';
import '../models/option_model.dart';
import '../models/orders_model.dart';
import '../models/product_model.dart';
import '../models/register_model.dart';
import '../models/time_model.dart';
import '../presentation/auth/screens/reset_password/reset_password_view.dart';
import '../presentation/main_navigation_bar/main_navigation_bar.dart';
import 'base_repo.dart';

class RepoImpl extends BaseRepo {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<bool> login(String phone, String password) async {
    Map<String, dynamic> body = {
      "phone": phone,
      "password": password,
      "access_token": _firebaseMessaging.getToken(),
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

  Future<List<CityModel>> getCities() async {
    var data = await DioHelper().get(
      url: AppStringsManager.cities,
    );
    if (data != null) {
      log("cart : $data");
      return List<CityModel>.from(data["data"].map(
        (e) => CityModel.fromJson(e),
      ));
    } else {
      return [];
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

  Future<Products?> productDetails(int id) async {
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

  Future<List<Products>> allProducts(int categoryId) async {
    var data = await DioHelper().get(
      url: AppStringsManager.allProducts + '$categoryId',
    );
    if (data != null) {
      return List<Products>.from(data["data"].map((e) => Products.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<List<GetCartModel>> getAllCart() async {
    var data = await DioHelper().get(
      url: AppStringsManager.cartProducts,
    );
    if (data != null) {
      log("cart : $data");
      return List<GetCartModel>.from(
        data["data"].map(
          (e) => GetCartModel.fromJson(e),
        ),
      );
    } else {
      return [];
    }
  }

  // Cart
  Future<bool> addToCart(AddToCartModel model) async {
    var data = await DioHelper().post(
      url: AppStringsManager.addToCart,
      body: model.toJson(),
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      NavigationService.removeUntil(MainNavigationBar());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteProductFromCart(int id) async {
    var data = await DioHelper().post(
      url: AppStringsManager.deleteProduct + '$id',
      body: {},
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      // NavigationService.removeUntil(MainNavigationBar());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteAllProducts() async {
    var data = await DioHelper().post(
      url: AppStringsManager.deleteAllProducts,
      body: {},
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      // NavigationService.removeUntil(MainNavigationBar());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> updateCart(int id, int quantity) async {
    var data = await DioHelper().post(
      url: AppStringsManager.updateCart + "$id",
      body: {'quantity': quantity},
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      // NavigationService.removeUntil(MainNavigationBar());
      return true;
    } else {
      return false;
    }
  }

  // Orders
  Future<List<TimeModel>> timeList() async {
    var data = await DioHelper().get(
      url: AppStringsManager.deliveryTime,
    );
    if (data != null) {
      log("cart : $data");
      return List<TimeModel>.from(data["data"].map(
        (e) => TimeModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }

  Future<OrdersModel?> currentOrders(int page) async {
    var data = await DioHelper().get(
      url: AppStringsManager.currentOrder + '$page',
    );
    if (data['data'] != null) {
      return OrdersModel.fromJson(data["data"]);
    }
    return null;
  }
  Future<OrdersModel?> completedOrders(int page) async {
    var data = await DioHelper().get(
      url: AppStringsManager.completedOrder + '$page',
    );
    if (data['data'] != null) {
      return OrdersModel.fromJson(data["data"]);
    }
    return null;
  }
}

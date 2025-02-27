import 'dart:developer';

import 'package:base_flutter/features/models/cateogries_model.dart';
import 'package:base_flutter/features/models/update_profile_model.dart';
import 'package:base_flutter/features/models/user_model.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/register_view.dart';
import 'package:base_flutter/features/presentation/main_navigation_bar/cubits/main_navigation_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/api_service/DioImports.dart';
import '../../core/helpers/preferences_helper.dart';
import '../../core/helpers/snack_helper.dart';
import '../../core/resource/app_strings_manager.dart';
import '../../core/resource/navigation_service.dart';
import '../../core/utils/utils_imports.dart';
import '../models/add_to_cart_model.dart';
import '../models/all_cart_model.dart';
import '../models/city_model.dart';
import '../models/contact_us_model.dart';
import '../models/coupon_response_model.dart';
import '../models/create_order_model.dart';
import '../models/notifications_model.dart';
import '../models/option_model.dart';
import '../models/order_details_model.dart';
import '../models/orders_model.dart';
import '../models/product_model.dart';
import '../models/register_model.dart';
import '../models/slider_model.dart';
import '../models/time_model.dart';
import '../presentation/auth/blocs/register_cubit/register_cubit.dart';
import '../presentation/auth/screens/reset_password/reset_password_view.dart';
import '../presentation/main_navigation_bar/main_navigation_bar.dart';
import 'base_repo.dart';

class RepoImpl extends BaseRepo {
  @override
  Future<bool> login(String phone) async {
    Map<String, dynamic> body = {
      "phone": phone,
      // "password": password,
      // "access_token": _firebaseMessaging.getToken(),
    };
    var data = await DioHelper().post(url: AppStringsManager.login, body: body);
    if (data["register_required"] != true) {
      Preferences.setString("token", data['token']);
      SnackBarHelper.showBasicSnack(msg: data['message']);
      // Utils.manipulateLoginData(data["user"], data['access_token']);
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data['error']);
      NavigationService.navigateTo(BlocProvider(
        create: (context) => RegisterCubit()..getPhone(phone),
        child: RegisterView(),
      ));
      return false;
    }
  }

  Future<UserModel?> getUserData() async {
    var data = await DioHelper().get(url: AppStringsManager.updatedUser);
    if (data['data'] != null) {
      log("User Data : ${data['data']}");
      UserModel user = UserModel.fromJson(data['data']);
      Utils.setCurrentUserData(user);
      NavigationService.removeUntil(
        MainNavigationBar(),
      );
    } else {
      return null;
    }
    return null;
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

  Future<bool> deleteAcc() async {
    var data = await DioHelper().delete(
      url: AppStringsManager.deleteAccount,
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      Preferences.clearAll();
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
    var data = await DioHelper().put(
      url: AppStringsManager.updateProfile,
      body: model.toJson(),
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      UserModel user = UserModel.fromJson(data['user']);
      Utils.setCurrentUserData(user);
      NavigationService.back();
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

  Future<CategoriesModel?> home() async {
    var data = await DioHelper().get(
      url: AppStringsManager.home,
    );
    if (data != null) {
      return CategoriesModel.fromJson(data);
    } else {
      return null;
    }
  }

  Future<ProductModel?> productDetails(int id) async {
    var data = await DioHelper().get(
      url: AppStringsManager.productDetails + "$id",
    );
    if (data != null) {
      return ProductModel.fromJson(data["product"]);
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

  Future<List<ProductModel>> allProducts(int categoryId) async {
    var data = await DioHelper().get(
      url: AppStringsManager.allProducts + '$categoryId',
    );
    if (data != null) {
      return List<ProductModel>.from(
          data["data"]['products'].map((e) => ProductModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<GetCartModel?> getAllCart() async {
    var data = await DioHelper().get(
      url: AppStringsManager.cartProducts,
    );
    if (data != null) {
      log("cart : $data");
      return GetCartModel.fromJson(data);
    } else {
      return null;
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
    var data = await DioHelper().delete(
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

  Future<OrderModel?> currentOrders() async {
    var data = await DioHelper().get(
      url: AppStringsManager.currentOrder,
    );
    if (data['data'] != null) {
      return OrderModel.fromJson(data);
    }
    return null;
  }

  Future<OrderModel?> completedOrders(int page) async {
    var data = await DioHelper().get(
      url: AppStringsManager.completedOrder ,
    );
    if (data['data'] != null) {
      return OrderModel.fromJson(data);
    }
    return null;
  }

  Future<OrderDetailsModel?> orderDetails(int id) async {
    var data = await DioHelper().get(
      url: AppStringsManager.orderDetails + '$id',
    );
    if (data['data'] != null) {
      return OrderDetailsModel.fromJson(data["data"]);
    }
    return null;
  }

  Future<bool> cancelOrder(int id, String reason) async {
    var data = await DioHelper().post(
      url: AppStringsManager.cancelOrder,
      body: {'order_id': id, 'reason': reason},
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      // NavigationService.removeUntil(MainNavigationBar());
      return true;
    } else {
      return false;
    }
  }

  Future<CouponResponseModel?> checkCoupon(String coupon) async {
    var data = await DioHelper().post(
      url: AppStringsManager.checkCoupon,
      body: {'coupon_code': coupon},
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data["message"]);
      return CouponResponseModel.fromJson(data);
    } else {
      return null;
    }
  }

  Future<bool> createOrder(CreateOrderModel model) async {
    var data = await DioHelper().post(
      url: AppStringsManager.createOrder,
      body: model.toJson(),
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      navigatorKey.currentContext!.read<BottomNavCubit>().updateIndex(1);
      NavigationService.removeUntil(MainNavigationBar());
      return true;
    } else {
      return false;
    }
  }

  // Settings
  Future<String?> settings(String pageName) async {
    var data = await DioHelper().get(
      url: AppStringsManager.settings + pageName,
    );
    if (data != null) {
      log("cart : $data");
      return data['content'];
    } else {
      return null;
    }
  }

  Future<ContactModel?> contactUs() async {
    var data = await DioHelper().get(
      url: AppStringsManager.settings + "contact",
    );
    if (data != null) {
      return ContactModel.fromJson(data);
    } else {
      return null;
    }
  }

  // slider
  Future<List<SliderModel>> slider() async {
    var data = await DioHelper().get(
      url: AppStringsManager.sliders,
    );
    if (data != null) {
      log("cart : $data");
      return List<SliderModel>.from(data["data"].map(
        (e) => SliderModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }

  Future<List<ProductModel>> search(String search) async {
    var data = await DioHelper().get(
      url: AppStringsManager.search + "$search",
    );
    if (data != null) {
      log("cart : $data");
      return List<ProductModel>.from(data["data"].map(
        (e) => ProductModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }

  // notifications

  Future<List<NotificationModel>> notifications() async {
    var data = await DioHelper().get(
      url: AppStringsManager.notifications,
    );
    if (data != null) {
      log("cart : $data");
      return List<NotificationModel>.from(data["data"].map(
        (e) => NotificationModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }

// review
  Future<bool> orderReview(int orderId, num rate, String comment) async {
    var data = await DioHelper().post(
      url: AppStringsManager.orderReview,
      body: {
        "order_id": orderId,
        "rate": rate,
        "comment": comment,
      },
    );
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['message']);
      NavigationService.removeUntil(MainNavigationBar());
      return true;
    } else {
      return false;
    }
  }
}

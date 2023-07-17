import '../models/add_to_cart_model.dart';
import '../models/all_cart_model.dart';
import '../models/city_model.dart';
import '../models/home_model.dart';
import '../models/option_model.dart';
import '../models/orders_model.dart';
import '../models/product_model.dart';
import '../models/register_model.dart';
import '../models/time_model.dart';
import '../models/update_profile_model.dart';

abstract class BaseRepo {
  // Auth
  Future<bool> login(String phone, String password);
  Future<bool> forgetPassword({required String phone});
  Future<bool> register(RegisterModel model);
  Future<bool> logout();
  Future<bool> resetPassword(
      String code, String password, String passwordConfirmation);
  Future<bool> updateProfile(UpdateProfileModel model);
  Future<bool> updatePassword(
      String oldPassword, String newPassword, String confirmNewPassword);
  Future<List<CityModel>> getCities();
  // Home
  Future<List<HomeModel>> home();
  // Animal Details
  Future<Products?> productDetails(int id);
// Options
  Future<List<OptionModel>> options();
  Future<List<Products>> allProducts(int categoryId);
  Future<List<GetCartModel>> getAllCart();

  // Cart
  Future<bool> addToCart(AddToCartModel model);
  Future<bool> deleteProductFromCart(int id);
  Future<bool> deleteAllProducts();
  Future<bool> updateCart(int id,int quantity);
  Future<List<TimeModel>> timeList();

  // orders
  Future<OrdersModel?> currentOrders(int page);
  Future<OrdersModel?> completedOrders(int page);
}

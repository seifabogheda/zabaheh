import '../models/add_to_cart_model.dart';
import '../models/all_cart_model.dart';
import '../models/cateogries_model.dart';
import '../models/city_model.dart';
import '../models/contact_us_model.dart';
import '../models/coupon_response_model.dart';
import '../models/create_order_model.dart';
import '../models/home_model.dart';
import '../models/notifications_model.dart';
import '../models/option_model.dart';
import '../models/order_details_model.dart';
import '../models/orders_model.dart';
import '../models/product_model.dart';
import '../models/register_model.dart';
import '../models/settings_model.dart';
import '../models/slider_model.dart';
import '../models/time_model.dart';
import '../models/update_profile_model.dart';
import '../models/user_model.dart';

abstract class BaseRepo {
  // Auth
  Future<bool> login(String phone);
  Future<UserModel?> getUserData();
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
  Future<CategoriesModel?> home();
  // Animal Details
  Future<ProductModel?> productDetails(int id);
// Options
  Future<List<OptionModel>> options();
  Future<List<ProductModel>> allProducts(int categoryId);
  Future<GetCartModel?> getAllCart();

  // Cart
  Future<bool> addToCart(AddToCartModel model);
  Future<bool> deleteProductFromCart(int id);
  Future<bool> deleteAllProducts();
  Future<bool> updateCart(int id,int quantity);
  Future<List<TimeModel>> timeList();

  // orders
  Future<OrderModel?> currentOrders();
  Future<OrderModel?> completedOrders(int page);
  Future<OrderDetailsModel?> orderDetails(int id);
  Future<bool> cancelOrder(int id, String reason);
  Future<CouponResponseModel?> checkCoupon(String coupon);
  Future<bool> createOrder(CreateOrderModel model);

  // settings
  Future<String?> settings(String pageName);
  Future<ContactModel?> contactUs();
  // slider
  Future<List<SliderModel>> slider();
  Future<List<ProductModel>> search(String search);

  // notifications
  Future<List<NotificationModel>> notifications();

  // review
  Future<bool> orderReview(int orderId, num rate,String comment);
  // delete account
  Future<bool> deleteAcc();
}

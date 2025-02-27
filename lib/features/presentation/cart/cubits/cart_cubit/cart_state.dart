part of 'cart_cubit.dart';

class CartState extends Equatable {
  final List<CartItems> cartList;
  final List<CityModel> cities;
  final num cartPrice;
  final num deliveryFee;
  final num cartPriceAfterCoupon;
  final num productPrice;
  final RequestState cartState;
  final RequestState couponState;
  final RequestState citiesState;
  CartState({

    this.cartList = const [],
    this.cities = const [],
    this.cartPrice = 0,
    this.deliveryFee = 0,
    this.cartPriceAfterCoupon = 0,
    this.cartState = RequestState.loading,
    this.couponState = RequestState.init,
    this.citiesState = RequestState.loading,
    this.productPrice = 0,
  });
  CartState copyWith({
    List<CartItems>? cartList,
    final List<CityModel>? cities,
    RequestState? cartState,
    RequestState? citiesState,
    RequestState? couponState,
    num? cartPrice,
    num? deliveryFee,
    num? productPrice,
    num? cartPriceAfterCoupon,
  }) {
    return CartState(
      cartList: cartList ?? this.cartList,
      cities: cities ?? this.cities,
      cartState: cartState ?? this.cartState,
      citiesState: citiesState ?? this.citiesState,
      couponState: couponState ?? this.couponState,
      deliveryFee: deliveryFee ?? this.deliveryFee,
      cartPrice: cartPrice ?? this.cartPrice,
      productPrice: productPrice ?? this.productPrice,
      cartPriceAfterCoupon: cartPriceAfterCoupon ?? this.cartPriceAfterCoupon,
    );
  }

  @override
  List<Object> get props =>
      [cartList, cartPrice, cartState, productPrice, cartPriceAfterCoupon,couponState,deliveryFee];
}

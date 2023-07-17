part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}
class CartLoading extends CartState {}
class CartSuccess extends CartState {
  final List<GetCartModel> cartList;

  CartSuccess(this.cartList);
  @override
  List<Object> get props => [cartList];
}
class CartFailed extends CartState {}

part of 'product_details_cubit.dart';

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();
  @override
  List<Object> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {}
class ProductDetailsLoading extends ProductDetailsState {}
class ProductDetailsSuccess extends ProductDetailsState {
  final Products products;

  ProductDetailsSuccess(this.products);
  @override
  List<Object> get props => [products];
}
class ProductDetailsFailed extends ProductDetailsState {}


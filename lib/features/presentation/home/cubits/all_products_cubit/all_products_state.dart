part of 'all_products_cubit.dart';

abstract class AllProductsState extends Equatable {
  const AllProductsState();
  @override
  List<Object> get props => [];
}

class AllProductsInitial extends AllProductsState {}
class AllProductsLoading extends AllProductsState {}
class AllProductsSuccess extends AllProductsState {
  final List<Products> allProducts;

  AllProductsSuccess(this.allProducts);
  @override
  List<Object> get props => [allProducts];
}
class AllProductsFailed extends AllProductsState {}

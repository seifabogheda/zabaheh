part of 'search_cubit.dart';

class SearchState extends Equatable {
  final List<Products> products;
  final RequestState searchState;
  const SearchState({this.products = const [], this.searchState=RequestState.init});
  SearchState copyWith({
    List<Products>? products,
    RequestState? searchState,
  }) {
    return SearchState(
        products: products ?? this.products,
        searchState : searchState ?? this.searchState,
    );
  }
  @override
  List<Object> get props => [products,searchState];
}


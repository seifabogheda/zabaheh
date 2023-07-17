part of 'add_to_cart_cubit.dart';

 class AddToCartState extends Equatable {
  final RequestState addToCartRequestState;
  final String addToCartMessage;


  const AddToCartState({this.addToCartRequestState = RequestState.init, this.addToCartMessage = ''});
  AddToCartState copyWith({
   RequestState? addToCartRequestState,
   String? addToCartMessage,
  }) {
   return AddToCartState(
    addToCartRequestState:
    addToCartRequestState ?? this.addToCartRequestState,
    addToCartMessage:
    addToCartMessage ?? this.addToCartMessage,
   );
  }

  @override
  List<Object> get props => [
   addToCartRequestState,addToCartMessage
  ];
}


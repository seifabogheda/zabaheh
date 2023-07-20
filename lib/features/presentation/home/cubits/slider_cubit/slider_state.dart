part of 'slider_cubit.dart';

class SliderState extends Equatable {
  final List<SliderModel> sliderList;
  final RequestState sliderState;
  const SliderState(
      {this.sliderList = const [], this.sliderState = RequestState.loading});
  SliderState copyWith({
    List<SliderModel>? sliderList,
    RequestState? sliderState,
  }) {
    return SliderState(
      sliderList: sliderList ?? this.sliderList,
      sliderState: sliderState ?? this.sliderState,
    );
  }

  @override
  List<Object> get props => [sliderList,sliderState];
}

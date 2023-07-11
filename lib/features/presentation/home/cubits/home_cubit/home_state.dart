part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {

}
class HomeLoading extends HomeState {}
class HomeSuccess extends HomeState {
  final List<HomeModel> home;

  HomeSuccess(this.home);
  @override
  List<Object> get props => [home];
}
class HomeFailed extends HomeState {}

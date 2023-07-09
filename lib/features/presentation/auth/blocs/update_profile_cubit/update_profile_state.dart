part of 'update_profile_cubit.dart';

abstract class UpdateProfileState extends Equatable {
  const UpdateProfileState();
  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState {}
class UpdateProfileLoading extends UpdateProfileState {}
class UpdateProfileSuccess extends UpdateProfileState {}
class UpdateProfileFailed extends UpdateProfileState {
  final String error;

  UpdateProfileFailed(this.error);
  @override
  List<Object> get props => [error];
}

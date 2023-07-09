part of 'reset_password_cubit.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();
  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}
class ResetPasswordLoading extends ResetPasswordState {}
class ResetPasswordSuccess extends ResetPasswordState {}
class ResetPasswordFailed extends ResetPasswordState {
  final String error;

  ResetPasswordFailed(this.error);
  List<Object> get props => [error];

}

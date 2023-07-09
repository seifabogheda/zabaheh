part of 'change_password_cubit.dart';

@immutable
abstract class ChangePasswordState  extends Equatable{
  @override
  List<Object> get props => [];
}

class ChangePasswordInitial extends ChangePasswordState {}
class ChangePasswordLoading extends ChangePasswordState {}
class ChangePasswordSuccess extends ChangePasswordState {}
class ChangePasswordFailed extends ChangePasswordState {
  final String error;

  ChangePasswordFailed(this.error);
  List<Object> get props => [error];

}
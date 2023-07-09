part of 'register_cubit.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();
  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterFailed extends RegisterState {
  final String error;

  RegisterFailed(this.error);
  @override
  List<Object> get props => [error];
}

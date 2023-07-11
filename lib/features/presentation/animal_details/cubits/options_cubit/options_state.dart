part of 'options_cubit.dart';

abstract class OptionsState extends Equatable {
  const OptionsState();
  @override
  List<Object> get props => [];
}
class OptionsInitial extends OptionsState {}
class OptionsLoading extends OptionsState {}
class OptionsSuccess extends OptionsState {
  final List<OptionModel> options;

  OptionsSuccess(this.options);

}
class OptionsFailed extends OptionsState {}
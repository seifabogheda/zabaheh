part of 'stepper_cubit.dart';

abstract class StepperState extends Equatable {
  final int step;
  final bool changed;
  const StepperState(this.step, this.changed);
}

class StepperInitial extends StepperState {
  StepperInitial(int step,) : super(step, false);

  @override
  List<Object> get props => [changed];
}
class StepperUpdated extends StepperState {
  StepperUpdated(int step,bool changed) : super(step, changed);

  @override
  List<Object> get props => [changed];
}

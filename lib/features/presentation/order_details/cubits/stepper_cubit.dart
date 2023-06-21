import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'stepper_state.dart';

class StepperCubit extends Cubit<StepperState> {
  StepperCubit(int step) : super(StepperInitial(step));

  onUpdateStep(int step) {
    emit(StepperUpdated(step, !state.changed));
  }
}

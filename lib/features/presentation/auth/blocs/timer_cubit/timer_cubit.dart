import 'dart:async';

import 'package:base_flutter/features/presentation/auth/blocs/timer_cubit/timer_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wakelock/wakelock.dart';

class TimerCubit extends Cubit<TimerState>{
  TimerCubit():super(const TimerInitial());

  Timer? _timer;
  onTick(Timer timer){
    if(state is TimerInProgress){
      TimerInProgress wip = state as TimerInProgress;
      if(wip.elapsed!> 0){
        emit(TimerInProgress( wip.elapsed!-1));

      }else{
        _timer!.cancel();
        Wakelock.disable();
        emit(const TimerInitial());
      }
    }
  }

  startWorkout( [int? index]){
    Wakelock.enable();
    if(index != null){
      emit(const TimerInProgress( 59));
    }else{
      emit(const TimerInProgress( 59));
    }
    _timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

}
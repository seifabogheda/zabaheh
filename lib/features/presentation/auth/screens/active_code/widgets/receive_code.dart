import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/timer_cubit/timer_cubit.dart';
import '../../../blocs/timer_cubit/timer_state.dart';

class ReceiveCode extends StatefulWidget {
  @override
  State<ReceiveCode> createState() => _ReceiveCodeState();
}

class _ReceiveCodeState extends State<ReceiveCode> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TimerCubit(),
      child: BlocBuilder<TimerCubit, TimerState>(
        builder: (context, state) {
          if(state is TimerInitial){
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  title: "لم تستلم الكود بعد ؟ ",
                  size: 16,
                  color: ColorManager.grey2,
                  fontWeight: FontWeight.w500,
                ),
                InkWell(
                  onTap: () {
                    BlocProvider.of<TimerCubit>(context).startWorkout(59);
                  },
                  child: MyText(
                    title: "أعد إرسال الكود",
                    size: 14,
                    color: ColorManager.green,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            );
          }
          if(state is TimerInProgress){
            print("${state.elapsed}");
            return Center(child: Text("0:${state.elapsed!}"),);
          }
          return Container();
        },
      ),
    );
  }
}

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/order_details/cubits/stepper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';

class OrderDetailsStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: context.width * 0.88,
      margin: EdgeInsets.only(top: 15, bottom: 10.5),
      child: BlocBuilder<StepperCubit, StepperState>(
        builder: (context, state) {
          return Stepper(
            type: StepperType.horizontal,
            elevation: 0,
            onStepTapped: (val) {
              context.read<StepperCubit>().onUpdateStep(val);
            },
            steps: [
              Step(
                  isActive: state.step == 0,
                  state:
                      state.step == 0 ? StepState.complete : StepState.indexed,
                  title: SizedBox(),
                  label: MyText(
                    title: "جارى التجهيز",
                    color: ColorManager.black,
                    size: 10,
                  ),
                  content: Container()),
              Step(
                  isActive: state.step == 1,
                  state:
                      state.step == 1 ? StepState.complete : StepState.indexed,
                  title: SizedBox(),
                  label: MyText(
                    title: "في الطريق",
                    color: ColorManager.black,
                    size: 10,
                  ),
                  content: Container()),
              Step(
                  isActive: state.step == 2,
                  state:
                      state.step == 2 ? StepState.complete : StepState.indexed,
                  title: SizedBox(),
                  label: MyText(
                    title: "تم التسليم",
                    color: ColorManager.black,
                    size: 10,
                  ),
                  content: Container()),
            ],
          );
        },
      ),
    );
  }
}

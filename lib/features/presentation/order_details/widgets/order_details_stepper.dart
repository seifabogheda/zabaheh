import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/order_details/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:base_flutter/features/presentation/order_details/cubits/stepper_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';

class OrderDetailsStepper extends StatefulWidget {
  @override
  State<OrderDetailsStepper> createState() => _OrderDetailsStepperState();
}

class _OrderDetailsStepperState extends State<OrderDetailsStepper> {

  getLastStatus(){
    if(context.read<OrderDetailsCubit>().state.orderDetailsModel?.status == 'pending'){
      context.read<StepperCubit>().onUpdateStep(0);
    }
    if(context.read<OrderDetailsCubit>().state.orderDetailsModel?.status == 'inDelivery'){
      context.read<StepperCubit>().onUpdateStep(1);
    }
    if(context.read<OrderDetailsCubit>().state.orderDetailsModel?.status == 'Delivered'){
      context.read<StepperCubit>().onUpdateStep(2);
    }
  }
  @override
  void initState() {
    getLastStatus();
    super.initState();
  }
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
            // onStepTapped: (val) {
            //   context.read<StepperCubit>().onUpdateStep(val);
            // },
            steps: [
              Step(
                  isActive: state.step == 0,
                  state:
                      state.step == 0 ? StepState.complete : StepState.indexed,
                  title: SizedBox(),
                  label: MyText(
                    title: tr(context, 'pending'),
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
                    title: tr(context, 'inDelivery'),

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
                    title: tr(context, 'Delivered'),
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

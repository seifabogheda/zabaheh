import 'package:base_flutter/features/presentation/order_details/widgets/order_details_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/stepper_cubit.dart';
import 'order_details_info.dart';
import 'order_details_item.dart';
import 'order_details_notices.dart';

class OrderDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BlocProvider(
          create: (context) => StepperCubit(0),
          child: OrderDetailsStepper(),
        ),
        OrderDetailsInfo(),
        OrderDetailsNotices(),
        OrderDetailsOrderItem(),
      ],
    );
  }
}

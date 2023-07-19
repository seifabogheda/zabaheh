import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/features/presentation/order_details/cubits/order_details_cubit/order_details_cubit.dart';
import 'package:base_flutter/features/presentation/order_details/widgets/order_details_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../cubits/stepper_cubit.dart';
import 'order_details_info.dart';
import 'order_details_item.dart';
import 'order_details_notices.dart';

class OrderDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
      builder: (context, state) {
        switch (state.orderDetailsState) {
          case RequestState.loading:
            return Center(
              child: AppLoaderHelper.showSimpleLoading(),
            );
          case RequestState.loaded:
            return ListView(
              children: [
                BlocProvider(
                  create: (context) => StepperCubit(0),
                  child: OrderDetailsStepper(),
                ),
                OrderDetailsInfo(
                  model: state.orderDetailsModel,
                ),
                OrderDetailsNotices(
                  notes: state.orderDetailsModel?.note ?? '',
                ),
                OrderDetailsOrderItem(
                  productsOrder: state.orderDetailsModel?.products ?? [],
                ),
              ],
            );
          case RequestState.error:
            return Center(
              child: MyText(
                title: "لا يوجد بيانات",
              ),
            );
          case RequestState.init:
            // TODO: Handle this case.
            break;
        }
        return SizedBox();
      },
    );
  }
}

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/features/presentation/orders/current_orders_cubit/current_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_item.dart';

class OrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CurrentOrdersCubit, CurrentOrdersState>(
      builder: (context, state) {
        if (state is CurrentOrdersSuccess) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child:state.ordersModel.orderData?.length != 0 ? ListView.builder(
                itemCount: state.ordersModel.orderData?.length,
                itemBuilder: (context, index) {
                  return OrderItem(
                    orderData: state.ordersModel.orderData![index],
                  );
                },
              ) : Center(
                  child: MyText(
                    title: "لا يوجد طلبات",
                  ))
          );
        }
        return state is CurrentOrdersLoading
            ? Center(
            child: AppLoaderHelper.showSimpleLoading())
            : Center(
                child: MyText(
                title: "لا يوجد طلبات",
              ));
      },
    );
  }
}

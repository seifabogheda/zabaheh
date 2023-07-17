import 'package:base_flutter/features/presentation/orders/tabs/current_order_view.dart';
import 'package:base_flutter/features/presentation/orders/tabs/finished_order_view.dart';
import 'package:base_flutter/features/presentation/orders/widgets/tab_bar_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../current_orders_cubit/current_orders_cubit.dart';

class OrdersBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarBody(),
        Flexible(
          child: TabBarView(
            children: [
              BlocProvider(
                create: (context) =>
                CurrentOrdersCubit()
                  ..getCurrentOrders(),
                child: CurrentOrderView(),
              ),
              BlocProvider(
                create: (context) => CurrentOrdersCubit()..getCompletedOrders(),
                child: FinishedOrderView(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

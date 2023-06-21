

import 'package:base_flutter/features/presentation/orders/widgets/orders_body.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/app_custom_appbar.dart';

class OrdersView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppCustomAppbar(
        titlePage: 'طلباتي',
        body: OrdersBody(),
      ),
    );
  }
}

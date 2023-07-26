

import 'package:base_flutter/features/presentation/orders/widgets/orders_body.dart';
import 'package:flutter/material.dart';

import '../../../core/localization/app_localizations.dart';
import '../../custom_widgets/app_custom_appbar.dart';

class OrdersView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppCustomAppbar(
        titlePage: tr(context,"orders"),
        body: OrdersBody(),
      ),
    );
  }
}

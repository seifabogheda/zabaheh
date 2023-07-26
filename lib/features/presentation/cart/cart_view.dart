import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/cart/widgets/cart_body.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/app_custom_appbar.dart';

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppCustomAppbar(
      titlePage: tr(context, "cart"),
      body: CartBody(),
    );
  }
}

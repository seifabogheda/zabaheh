import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/order_details/widgets/order_details_body.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
      title: "تفاصيل الطلب",
      needBack: true,
      scaffoldColor: ColorManager.offWhite,
      textColor: ColorManager.green,
      child: Expanded(
        child: OrderDetailsBody(),
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: ColorManager.white,
        child: CustomButton(title: "استلام الطلب",onTap: (){},),
      ),
    );
  }
}

import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/helpers/ui_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/order_details/widgets/order_details_body.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatefulWidget {
  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  @override
  initState() {
    super.initState();
    controller = BottomSheet.createAnimationController(this);
    // Animation duration for displaying the BottomSheet
    controller.duration = const Duration(milliseconds: 600);
    // Animation duration for retracting the BottomSheet
    controller.reverseDuration = const Duration(milliseconds: 600);
    // Set animation curve duration for the BottomSheet
    controller.drive(CurveTween(curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

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
        child: CustomButton(
          title: "استلام الطلب",
          onTap: () {
            // todo : // create rating screen
            UIHelper.showBottomSheet(
                context: context,
                controller: controller,
                child: Center(child: Text("Seif Abogheda Number #1"),),
                height: 100);
          },
        ),
      ),
    );
  }
}

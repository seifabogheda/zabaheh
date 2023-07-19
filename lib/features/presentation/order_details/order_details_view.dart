import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/ui_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/order_details/widgets/order_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/helpers/snack_helper.dart';
import 'cubits/order_details_cubit/order_details_cubit.dart';

class OrderDetailsView extends StatefulWidget {
  final int id;

  const OrderDetailsView({Key? key, required this.id}) : super(key: key);

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late TextEditingController reasonController;

  @override
  initState() {
    super.initState();
    reasonController = TextEditingController();
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
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit()..orderDetails(widget.id),
      child: AuthCustomAppBar(
        title: "تفاصيل الطلب",
        needBack: true,
        scaffoldColor: ColorManager.offWhite,
        textColor: ColorManager.green,
        child: Expanded(
          child: OrderDetailsBody(),
        ),
        bottomNavigationBar: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            return Container(
              height: 70,
              color: ColorManager.white,
              child: state.orderDetailsModel?.orderStatus ==
                      OrderState.completed.name
                  ? CustomButton(
                      title: "استلام الطلب",
                      onTap: () {
                        // todo : // create rating screen
                        UIHelper.showBottomSheet(
                            context: context,
                            controller: controller,
                            child: Center(
                              child: Text("Seif Abogheda Number #1"),
                            ),
                            height: 100);
                      },
                    )
                  : state.orderDetailsModel?.orderStatus ==
                          OrderState.pending.name
                      ? CustomButton(
                          title: "الغاء الطلب",
                          onTap: () {
                            UIHelper.showBottomSheet(
                              context: context,
                              controller: controller,
                              height: context.height * 0.45,
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        MyText(
                                          title: "ماهو سبب إلغاء الطلب ؟",
                                          color: ColorManager.black,
                                        ),
                                        Divider(
                                          color: ColorManager.grey2,
                                        ),
                                        CustomTextField(
                                          validator: (value) =>
                                              value?.noValidate(),
                                          fieldTypes: FieldTypes.normal,
                                          type: TextInputType.text,
                                          hint: "سبب الغاء الطلب",
                                          controller: reasonController,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                title: 'تأكيد الالغاء',
                                                onTap: () {
                                                  if (reasonController
                                                      .text.isNotEmpty) {
                                                    context
                                                        .read<
                                                            OrderDetailsCubit>()
                                                        .cancelOrder(
                                                            state.orderDetailsModel
                                                                    ?.id ??
                                                                0,
                                                            reasonController
                                                                .text);
                                                  } else {
                                                    SnackBarHelper.showBasicSnack(
                                                        msg: "اكتب السبب اولا");
                                                  }
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: CustomButton(
                                                title: 'تراجع',
                                                onTap: () {
                                                  NavigationService.back();
                                                },
                                                color: ColorManager.offWhite,
                                                textColor: ColorManager.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : SizedBox(),
            );
          },
        ),
      ),
    );
  }
}

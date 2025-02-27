import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/ui_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/order_details/widgets/order_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/helpers/snack_helper.dart';
import '../../../core/localization/app_localizations.dart';
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
  late TextEditingController commentReviewController;

  @override
  initState() {
    super.initState();
    reasonController = TextEditingController();
    commentReviewController = TextEditingController();
    controller = BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 600);
    controller.reverseDuration = const Duration(milliseconds: 600);
    controller.drive(CurveTween(curve: Curves.easeIn));
  }

  final GenericCubit<num> rateCubit = GenericCubit(0.0);
  @override
  void dispose() {
    controller.dispose();
    reasonController.dispose();
    commentReviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit()..orderDetails(widget.id),
      child: AuthCustomAppBar(
        title: tr(context, "orderDetails"),
        needBack: true,
        scaffoldColor: ColorManager.offWhite,
        textColor: ColorManager.black,
        child: Expanded(
          child: OrderDetailsBody(),
        ),
        bottomNavigationBar: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
          builder: (context, state) {
            return Container(
              height: 70,
              color: ColorManager.white,
              child: state.orderDetailsModel?.status ==
                      OrderState.completed
                  ? CustomButton(
                      title: tr(context, "receiveOrder"),
                      onTap: () {
                        UIHelper.showBottomSheet(
                          context: context,
                          controller: controller,
                          child: Center(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                  MyText(
                                    title: tr(context, "rateOrder"),
                                    color: ColorManager.green,
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  MyText(
                                    title: tr(context, "rateComment"),
                                    color: ColorManager.grey2,
                                    size: 10,
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  BlocBuilder<GenericCubit<num>,
                                      GenericState<num>>(
                                    bloc: rateCubit,
                                    builder: (context, state) {
                                      return RatingBar.builder(
                                        initialRating: 0,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemPadding: EdgeInsets.symmetric(
                                            horizontal: 4.0),
                                        itemBuilder: (context, _) => Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (rating) {
                                          rateCubit.onUpdateData(rating);
                                        },
                                      );
                                    },
                                  ),
                                  CustomTextField(
                                    validator: (value) => value?.noValidate(),
                                    fieldTypes: FieldTypes.normal,
                                    type: TextInputType.text,
                                    hint: tr(context, "rateComment"),
                                    controller: commentReviewController,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CustomButton(
                                          title: tr(context, "sendRate"),
                                          onTap: () {
                                            if (commentReviewController
                                                .text.isNotEmpty) {
                                              context
                                                  .read<OrderDetailsCubit>()
                                                  .reviewOrder(
                                                      state.orderDetailsModel
                                                              ?.id ??
                                                          0,
                                                      rateCubit.state.data,
                                                      commentReviewController
                                                          .text);
                                            } else {
                                              SnackBarHelper.showBasicSnack(
                                                  msg: tr(context,
                                                      "insertRateComment"));
                                            }
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomButton(
                                          title: tr(context, "back"),
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
                          height: context.height * 0.5,
                        );
                      },
                    )
                  : state.orderDetailsModel?.status ==
                          OrderState.pending.name
                      ? CustomButton(
                          title: tr(context, "cancel"),
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
                                          title: tr(
                                              context, "whyOrderCancelReason"),
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
                                          hint:
                                              tr(context, "cancelOrderReason"),
                                          controller: reasonController,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                              child: CustomButton(
                                                title: tr(context, "confirm"),
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
                                                        msg: tr(context, "writeReasonFirst"));
                                                  }
                                                },
                                              ),
                                            ),
                                            Expanded(
                                              child: CustomButton(
                                                title: tr(context, "back"),
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

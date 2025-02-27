
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/features/presentation/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/resource/color_manager.dart';


class CartReceiveOrder extends StatefulWidget {
  @override
  State<CartReceiveOrder> createState() => _CartReceiveOrderState();
}

class _CartReceiveOrderState extends State<CartReceiveOrder> {
  final GenericCubit<int> selectWayReceiveOrderCubit = GenericCubit(0);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    return Container(
      width: context.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Form(
        key: cubit.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: MyText(
                title: "${tr(context, "receiveOrder")}:",
                color: ColorManager.black,
                size: 14,
              ),
            ),
            Divider(),
            BlocBuilder<GenericCubit<int>, GenericState<int>>(
              bloc: selectWayReceiveOrderCubit,
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Radio<int>(
                            value: 0,
                            groupValue: state.data,
                            onChanged: (value) {
                              selectWayReceiveOrderCubit.onUpdateData(0);
                              cubit.deliveryPrice = cubit.state.deliveryFee;
                              cubit.selectedReceivePlaceOrder = 0;
                              cubit.culTotalPrice();
                            }),
                        MyText(
                          title: tr(context, 'delivery'),
                          color: state.data == 0
                              ? ColorManager.black
                              : ColorManager.grey2,
                          size: 12,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Radio<int>(
                            value: 1,
                            groupValue: state.data,
                            onChanged: (value) {
                              cubit.deliveryPrice = 0;
                              cubit.culTotalPrice();
                              selectWayReceiveOrderCubit.onUpdateData(1);
                              cubit.selectedReceivePlaceOrder = 1;
                            }),
                        MyText(
                          title: tr(context, 'pickUp'),
                          color: state.data == 1
                              ? ColorManager.black
                              : ColorManager.grey2,
                          size: 12,
                        ),
                      ],
                    ),
                    if (state.data == 0) ...[
                      CustomTextField(
                        validator: (value) => value?.validateEmpty(context),
                        fieldTypes: FieldTypes.normal,
                        type: TextInputType.text,
                        controller: cubit.dateController,
                        upperText: tr(context, 'address'),
                      ),
                      CustomTextField(
                        validator: (value) => value?.noValidate(),
                        fieldTypes: FieldTypes.normal,
                        type: TextInputType.text,
                        controller: cubit.notesController,
                        hint: tr(context, "WriteNotesHere"),
                        upperText: tr(context, "addNotes"),
                        maxLines: 3,
                        // controller: cubit.notesController,
                      ),
                    ]
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';
import 'build_receive_order_time_item.dart';

class CartReceiveOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GenericCubit<int> selectWayReceiveOrderCubit = GenericCubit(0);
    final GenericCubit<int> selectTimeReceiveOrderCubit = GenericCubit(0);
    return Container(
      height: context.height * 0.62,
      width: context.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: MyText(
              title: "إستلام الطلب:",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          Divider(),
          BlocBuilder<GenericCubit<int>, GenericState<int>>(
            bloc: selectWayReceiveOrderCubit,
            builder: (context, state) {
              return Row(
                children: [
                  Radio<int>(
                      value: 0,
                      groupValue: state.data,
                      onChanged: (value) {
                        selectWayReceiveOrderCubit.onUpdateData(value!);
                      }),
                  MyText(
                    title: "توصيل",
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
                        selectWayReceiveOrderCubit.onUpdateData(value!);
                      }),
                  MyText(
                    title: "إستلام من الفرع",
                    color: state.data == 1
                        ? ColorManager.black
                        : ColorManager.grey2,
                    size: 12,
                  ),
                ],
              );
            },
          ),
          CustomTextField(
            onTap: () {
              // todo : open google map -_-
            },
            validator: (value) {},
            fieldTypes: FieldTypes.clickable,
            type: TextInputType.none,
            hint: "برجاء تحديد موقع التوصيل",
            upperText: "موقع التوصيل",
            suffixIcon: Icon(
              Icons.location_on_sharp,
              color: ColorManager.error,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: MyText(
              title: "وقت التوصيل",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          BlocBuilder<GenericCubit<int>, GenericState<int>>(
            bloc: selectTimeReceiveOrderCubit,
            builder: (context, state) {
              return Wrap(
                children: List.generate(
                  3,
                  (index) => InkWell(
                      onTap: () {
                        selectTimeReceiveOrderCubit.onUpdateData(index);
                      },
                      child: BuildReceiveOrderTimeItem(
                        index: index, selectedCubit: selectTimeReceiveOrderCubit,
                      )),
                ),
              );
            },
          ),
          CustomTextField(
            validator: (value) => value?.noValidate(),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            hint: "في حالة وجود ملاحظات أضف هنا",
            upperText: "ملاحظاتك",
            maxLines: 3,
          ),

        ],
      ),
    );
  }
}

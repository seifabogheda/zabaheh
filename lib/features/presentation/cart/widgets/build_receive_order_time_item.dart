import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/time_model.dart';

class BuildReceiveOrderTimeItem extends StatelessWidget {
  final int index;
  final GenericCubit<int> selectedCubit;
  final TimeModel model;
  const BuildReceiveOrderTimeItem(
      {Key? key,
      required this.index,
      required this.selectedCubit,
      required this.model})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      height: 40,
      width: 150,
      decoration: BoxDecoration(
        color: selectedCubit.state.data == index
            ? ColorManager.selectedTimeColor
            : ColorManager.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: selectedCubit.state.data == index
                ? ColorManager.primary
                : ColorManager.grey2),
      ),
      child: Row(
        children: [
          Radio<int>(
              value: index,
              groupValue: selectedCubit.state.data,
              onChanged: (value) {
                selectedCubit.onUpdateData(value!);
              }),
          MyText(
            title: "من ${model.from} : الى ${model.to}",
            color: ColorManager.black,
            size: 11,
          ),
        ],
      ),
    );
  }
}

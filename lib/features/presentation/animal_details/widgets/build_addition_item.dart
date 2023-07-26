
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/models/option_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_to_cart_cubit/add_to_cart_cubit.dart';

class BuildAdditionItem extends StatelessWidget {
  final OptionModel model;

  const BuildAdditionItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GenericCubit<int> radioCubit = GenericCubit(0);
    return BlocBuilder<AddToCartCubit, AddToCartState>(
  builder: (context, state) {
    var cubit = AddToCartCubit.get(context);
    return Container(
      color: ColorManager.white,
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Align(alignment: Alignment.topRight, child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: MyText(title: model.name ?? '',
              color: ColorManager.green,
              size: 14,),
          )),
          Divider(color: ColorManager.grey2, thickness: 0.1,),
          Column(
            children: List.generate(model.optionValues?.length ?? 0, (index) =>
                Row(
                  children: [
                    BlocBuilder<GenericCubit<int>, GenericState<int>>(
                      bloc: radioCubit,
                      builder: (context, state) {
                        return Radio<int>(
                          value: model.optionValues?[index].id ?? 0,
                          groupValue: state.data,
                          onChanged: (value) {
                            radioCubit.onUpdateData(value!);
                            cubit.options?.add(value);
                          },
                        );
                      },
                    ),
                    Expanded(
                      child: MyText(
                        title: '${model.optionValues?[index].value}',
                        color: ColorManager.black,
                        size: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MyText(
                        title: "${model.optionValues?[index].price}",
                        color: ColorManager.green,
                        size: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  },
);
  }
}

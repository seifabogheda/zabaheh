import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/add_to_cart_cubit/add_to_cart_cubit.dart';

class BuildQty extends StatelessWidget {
  final GenericCubit<int> quantityCubit = GenericCubit(0);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: BlocBuilder<GenericCubit<int>, GenericState<int>>(
        bloc: quantityCubit,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  quantityCubit.onUpdateData(state.data + 1);
                  context.read<AddToCartCubit>().quantity =
                      quantityCubit.state.data;
                },
                child: CircleAvatar(
                  backgroundColor: ColorManager.green,
                  child: MyText(
                    title: "+",
                    size: 25,
                    color: ColorManager.white,
                  ),
                ),
              ),
              MyText(
                title: "${state.data}",
                size: 18,
                color: ColorManager.black,
              ),
              InkWell(
                onTap: () {
                  if (state.data > 0) {
                    quantityCubit.onUpdateData(state.data - 1);
                    context.read<AddToCartCubit>().quantity =
                        quantityCubit.state.data;
                  }
                },
                child: CircleAvatar(
                  backgroundColor: ColorManager.offWhite,
                  child: MyText(
                    title: "-",
                    size: 25,
                    color: ColorManager.grey,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

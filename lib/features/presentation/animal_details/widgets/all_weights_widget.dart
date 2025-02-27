import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/product_model.dart';
import '../cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'build_addition_item.dart';

class AllWeightsWidget extends StatelessWidget {
  final List<Variants> variants;
  const AllWeightsWidget({super.key, required this.variants});

  @override
  Widget build(BuildContext context) {
    final GenericCubit<int> radioCubit = GenericCubit(0);

    return Container(
      padding: const EdgeInsets.all(10),
      color: ColorManager.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: "حجم الذبيحة",
            size: 16,
            fontWeight: FontWeight.bold,
            color: ColorManager.black,
          ),
          const SizedBox(
            height: 5,
          ),
          ...List.generate(
            variants.length,
            (index) => BlocBuilder<AddToCartCubit, AddToCartState>(
              builder: (context, state) {
                var cubit = AddToCartCubit.get(context);
                return BlocBuilder<GenericCubit<int>, GenericState<int>>(
                  bloc: radioCubit,
                  builder: (context, state) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Radio<int>(
                            value: variants[index].id ?? 0,
                            groupValue: state.data,
                            onChanged: (value) {
                              radioCubit.onUpdateData(value!);
                              context.read<AddToCartCubit>().variantId = value;
                            },
                          ),
                          MyText(
                            title: variants[index].weight ?? '',
                            size: 16,
                            color: ColorManager.black,
                          ),
                          Spacer(),
                          MyText(
                            title: "${variants[index].price} ر.س" ?? '',
                            size: 15,                            color: ColorManager.black,

                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

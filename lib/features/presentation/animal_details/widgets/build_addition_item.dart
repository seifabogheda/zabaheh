import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/product_model.dart';
import '../cubits/add_to_cart_cubit/add_to_cart_cubit.dart';

class BuildAdditionItem extends StatelessWidget {

  final Options options;

  const BuildAdditionItem({Key? key, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GenericCubit<int> radioCubit = GenericCubit(0);
    return BlocBuilder<AddToCartCubit, AddToCartState>(
      builder: (context, state) {
        return BlocBuilder<GenericCubit<int>, GenericState<int>>(
          bloc: radioCubit,
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Radio<int>(
                    value: options.id ?? 0,
                    groupValue: state.data,
                    onChanged: (value) {
                      radioCubit.onUpdateData(value!);
                    },
                  ),
                  MyText(
                    title: options.name ?? '',
                    size: 16,
                  ),
                  Spacer(),
                  MyText(
                    title: "${options.price}  ${tr(context, 'sr')}",
                    size: 15,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

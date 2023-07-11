import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/features/presentation/animal_details/cubits/product_details/product_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/options_cubit/options_cubit.dart';
import 'build_addition_item.dart';
import 'build_custom_addition.dart';
import 'build_qty.dart';

class AllAddition extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ProductDetailsCubit>();
    return BlocProvider(
      create: (context) => OptionsCubit()..getOptions(),
      child: BlocBuilder<OptionsCubit, OptionsState>(
        builder: (context, state) {
          return state is OptionsSuccess ? Column(
            children: [
              ...List.generate(state.options.length, (index) => BuildAdditionItem(model: state.options[index],),),
              BuildCustomAddition(),
              BuildQty(),
            ],
          ) : Expanded(child: Center(child: AppLoaderHelper.showSimpleLoading(),));
        },
      ),
    );
  }
}

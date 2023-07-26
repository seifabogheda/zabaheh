import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/custom_widgets/animal_item.dart';
import 'package:base_flutter/features/presentation/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Expanded(
          child: Column(
            children: [
              CustomTextField(
                validator: (value) => value?.noValidate(),
                fieldTypes: FieldTypes.normal,
                type: TextInputType.text,
                hint: "ابحث عما تريد...",
                suffixIcon: Icon(Icons.search),
                controller: context.read<SearchCubit>().searchController,
                onFieldSubmitted: (value){
                  context.read<SearchCubit>().search();
                },
              ),
              if(state.searchState == RequestState.init)
                Center(child: MyText(title: "ابدا بالبحث",),),
              if(state.searchState == RequestState.loading)
                Center(child: AppLoaderHelper.showSimpleLoading(),),
              if(state.searchState == RequestState.loaded)
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: context.read<SearchCubit>().state.products.length,
                    itemBuilder: (context, index) {
                      return AnimalItem(product: context.read<SearchCubit>().state.products[index],);
                    },
                  ),
                )

            ],
          ),
        );
      },
    );
  }
}

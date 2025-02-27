import 'dart:developer';

import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/models/cateogries_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../cubits/all_products_cubit/all_products_cubit.dart';
import 'home_item.dart';
import 'home_see_all_view.dart';

class HomeList extends StatelessWidget {
  final CategoriesModel model;

  const HomeList({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(model.data?.length ?? 0, (index) {
        log("model data ${model.data?[index].name}");
        return Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: MyText(
                    title: model.data?[index].name ?? '',
                    color: ColorManager.black,
                    fontWeight: FontWeight.w600,
                    size: 14,
                  ),
                ),
                InkWell(
                  onTap: () {
                    NavigationService.navigateTo(BlocProvider(
                      create: (context) => AllProductsCubit()..getAllProducts(model.data?[index].id ?? 0),
                      child: HomeSeeAllView(categoryTitle: '${model.data?[index].name}',),
                    ));
                  },
                  child: MyText(
                    title: tr(context, "seeAll"),
                    color: ColorManager.green,
                    fontWeight: FontWeight.w600,
                    size: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 100,
            margin: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.centerRight,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: model.data!.length > 4 ? 4 : model.data?.length,
              itemBuilder: (_, position) {
                return HomeItem(
                  products: model.data![index].products![position],
                );
              },
            ),
          ),
        ],);
      }),
    );
  }
}

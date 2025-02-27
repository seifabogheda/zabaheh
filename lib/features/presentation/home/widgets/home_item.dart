import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../models/cateogries_model.dart';
import '../../animal_details/animal_details_view.dart';
import '../../animal_details/cubits/product_details/product_details_cubit.dart';

class HomeItem extends StatelessWidget {
  final Products products;

  const HomeItem({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.navigateTo(BlocProvider(
          create: (context) => ProductDetailsCubit()..getProductDetails(products.id ?? 1),
          child: AnimalDetailsView(title: products.name ?? '', productId: products.id ?? 1,),
        ));
      },
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 7),
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedImage(
              url: products.image ?? '',
              borderRadius: BorderRadius.circular(10),
              width: 100,
              height: 130,
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: products.name ?? '',
                  color: ColorManager.black,
                  fontWeight: FontWeight.w600,
                  size: 14,
                ),
                SizedBox(height: 10,),
                MyText(
                  title:"${products.price}  ${tr(context, 'sr')}",
                  color: ColorManager.grey,
                  fontWeight: FontWeight.w600,
                  size: 12,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

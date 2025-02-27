import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base_widgets/my_text.dart';
import '../../core/resource/color_manager.dart';
import '../presentation/animal_details/animal_details_view.dart';
import '../presentation/animal_details/cubits/product_details/product_details_cubit.dart';

class AnimalItem extends StatelessWidget {
  final ProductModel product;
  final String image =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9dzIHVAv1xLixcBkhvrQczkClOugFe5qPtg&usqp=CAU';

  const AnimalItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.navigateTo(BlocProvider(
          create: (context) => ProductDetailsCubit()..getProductDetails(product.id ?? 0),
          child: AnimalDetailsView(
            title: product.name ?? '',
            productId: product.id ?? 0,
          ),
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorManager.white,
          border: Border.all(color: ColorManager.grey1.withValues(alpha: 0.5)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            CachedImage(
              url: product.image ?? '',
              height: 100,
              width: 100,
              haveRadius: true,
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(width: 10,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyText(
                  title: product.name ?? '',
                  color: ColorManager.black,
                  fontWeight: FontWeight.w600,
                  size: 16,
                ),
                SizedBox(
                  height: 10,
                ),
                MyText(
                  title: "${product.price} ر.س",
                  color: ColorManager.grey,
                  fontWeight: FontWeight.w600,
                  size: 15,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

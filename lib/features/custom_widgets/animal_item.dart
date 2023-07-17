import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/base_widgets/my_text.dart';
import '../../core/resource/color_manager.dart';
import '../presentation/animal_details/animal_details_view.dart';
import '../presentation/animal_details/cubits/product_details/product_details_cubit.dart';

class AnimalItem extends StatelessWidget {
  final Products product;
  final String image =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9dzIHVAv1xLixcBkhvrQczkClOugFe5qPtg&usqp=CAU';

  const AnimalItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.navigateTo(BlocProvider(
          create: (context) => ProductDetailsCubit()..getProductDetails(1),
          child: AnimalDetailsView(title: '', productId: 0,),
        ));
      },
      child: Container(
        height: 80,
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(horizontal: 5),
              height: 65,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(product.image ?? ''), scale: 2, fit: BoxFit.fill),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  title: product.name ?? '',
                  color: ColorManager.black,
                  fontWeight: FontWeight.w600,
                  size: 12,
                ),
                SizedBox(
                  height: 10,
                ),
                MyText(
                  title: product.cityName ?? '',
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

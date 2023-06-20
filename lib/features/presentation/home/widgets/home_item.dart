
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../animal_details/animal_details_view.dart';

class HomeItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.navigateTo(AnimalDetailsView());
      },
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 7),
        padding : const EdgeInsets.symmetric(horizontal: 7),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedImage(
              url: '',
              borderRadius: BorderRadius.circular(10),
              width: 100,
              height: 130,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyText(
                  title: 'نعيمي بلدي',
                  color: ColorManager.black,
                  fontWeight: FontWeight.w600,
                  size: 12,
                ),
                SizedBox(height: 10,),
                MyText(
                  title: 'الرياض',
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

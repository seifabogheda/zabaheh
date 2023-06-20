import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../core/base_widgets/my_text.dart';
import '../../core/resource/color_manager.dart';
import '../presentation/animal_details/animal_details_view.dart';

class AnimalItem extends StatelessWidget {
  final String image =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9dzIHVAv1xLixcBkhvrQczkClOugFe5qPtg&usqp=CAU';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.navigateTo(AnimalDetailsView());
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
                    image: NetworkImage(image), scale: 2, fit: BoxFit.fill),
              ),
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
                SizedBox(
                  height: 10,
                ),
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

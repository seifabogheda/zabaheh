
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class BuildAdditionItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return Container(
        color: ColorManager.white,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            Align(alignment:Alignment.topRight, child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MyText(title: "حجم الذبيحة",color: ColorManager.green,size: 14,),
            )),
            Divider(color: ColorManager.grey2,thickness: 0.1,),
            Column(
              children: List.generate(3, (index) => Row(
                children: [
                  Radio<num>(
                    value: 0,
                    groupValue: 1,
                    onChanged: (value){},
                  ),
                  Expanded(
                    child: MyText(
                      title: 'نعيمي هرفي صغير (10 - 20 ك)',
                      color: ColorManager.black,
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: MyText(
                      title: "500 ريال",
                      color: ColorManager.green,
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
              ),
            ),
          ],
        ),
      );
  }
}

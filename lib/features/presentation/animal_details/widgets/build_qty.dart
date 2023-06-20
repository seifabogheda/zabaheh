import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class BuildQty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.green,
            child: MyText(
              title: "+",
              size: 25,
              color: ColorManager.white,
            ),
          ),
          MyText(
            title: "5",
            size: 18,
            color: ColorManager.black,
          ),
          CircleAvatar(
            backgroundColor: ColorManager.offWhite,
            child: MyText(
              title: "-",
              size: 25,
              color: ColorManager.grey,
            ),
          ),
        ],
      ),
    );
  }
}

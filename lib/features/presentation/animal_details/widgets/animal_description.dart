
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';


class AnimalDescription extends StatelessWidget {
  final String title;
  final String desc;

  const AnimalDescription({Key? key, required this.title, required this.desc}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 10),
      color: ColorManager.white,
      child: Column(
        children: [
          MyText(title: title,color: ColorManager.primary,size: 16,),
          SizedBox(height: 10,),
          MyText(title:desc,color: ColorManager.grey2,size: 12,
          fontWeight: FontWeight.normal,),
        ],
      ),
    );
  }
}

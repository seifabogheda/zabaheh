
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base_widgets/my_text.dart';

class MoreItem extends StatelessWidget {
  final String titleItem;
  final String imageItem;
  final Function() onTap;
  final bool? isLogout;

  const MoreItem({Key? key, required this.titleItem, required this.imageItem, required this.onTap, this.isLogout = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width*0.9,
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color:isLogout == true ? Color(0xFFEC2F2F).withValues(alpha: 0.5  ): ColorManager.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
          isLogout  == true? CircleAvatar(
            radius: 15,
            backgroundColor: ColorManager.primary,
            child: SvgPicture.asset(imageItem),
          ) :SvgPicture.asset(imageItem),
            SizedBox(width: 10,),
            MyText(title: titleItem,size: 12,color: ColorManager.black,fontWeight: FontWeight.w600,),

            Spacer(),
          isLogout == true ? SizedBox():  Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}

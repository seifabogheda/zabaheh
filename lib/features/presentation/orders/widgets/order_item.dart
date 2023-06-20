import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // todo : fix my orders
    return Container(
      height: 120,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: ColorManager.offWhite,
              borderRadius: BorderRadius.circular(15),
            ),
            child: CachedImage(
              url:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTA2Nyo6Kgr43mj1hQnuypINqA0RjFtwWujzg&usqp=CAU",
              borderRadius: BorderRadius.circular(15),
              height: 60,
              width: 50,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(

                children: [
                  MyText(title: "رقم الطلب : #12354",color: ColorManager.black,size: 14,),
                  SizedBox(width: 70,),

                  MyText(title: "منذ 1 ساعة",color: ColorManager.grey,size: 10,),

                ],
              ),
              SizedBox(height: 15,),

              Row(
                children: [
                  MyText(title: "اسم المنتج :",color: ColorManager.grey,size: 10,),
                  MyText(title: "وسط نعيمي بلدي",color: ColorManager.grey,size: 10,),

                ],
              ),
              Divider(),
              SizedBox(height: 15,),
              Row(
                children: [
                  Row(children: [
                    Icon(Icons.gif_box_outlined),
                    MyText(title: "الحالة :",color: ColorManager.grey,size: 12,),
                    MyText(title: "جاري التجهيز",color: ColorManager.primary,size: 12,),
                  ],
                  ),
                  SizedBox(width: 70,),
                  Row(
                    children: [
                      MyText(title: "عرض المزيد",color: ColorManager.black,size: 10,),
                      Icon(Icons.arrow_forward_ios),
                    ],
                  ),

                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

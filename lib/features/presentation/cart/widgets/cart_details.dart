
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';import '../../../../core/base_widgets/cache_image.dart';


import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class CartDetails extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.2,
      width: context.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: MyText(
              title: "تفاصيل الطلب: ",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 90,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 4),
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyText(
                      title: " نعيمي بلدي",
                      color: ColorManager.black,
                      size: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    Row(
                      children: [
                        MyText(
                          title: "وسط - تقطيع مفاصل",
                          color: ColorManager.black,
                          size: 10,
                          fontWeight: FontWeight.normal,
                        ),
                        Spacer(),
                        Container(
                          height: 40,
                          width: 100,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: ColorManager.offWhite,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: ColorManager.grey2),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap:(){},
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorManager.grey2),
                                    color: ColorManager.white,
                                  ),
                                  child: Icon(Icons.remove,color: ColorManager.grey,size: 20,),
                                ),
                              ),
                              MyText(title: "2",size: 14,fontWeight: FontWeight.w600,color: ColorManager.black,),
                              InkWell(
                                onTap:(){},
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: ColorManager.grey2),
                                    color: ColorManager.green,
                                  ),
                                  child: Icon(Icons.add,color: ColorManager.white,size: 20,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    MyText(
                      title: "30.00 رس",
                      color: ColorManager.primary,
                      size: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

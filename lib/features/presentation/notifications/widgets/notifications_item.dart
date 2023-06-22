import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class NotificationsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      width: context.width * 0.85,
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            child: CachedImage(
              url:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIQPOQnXnGmQZgzX1VuscGMb4S0i5cq20Dqw&usqp=CAU",
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: SizedBox(
                    width: context.width * 0.7,
                    child: MyText(
                      title: "هذا النص هو مثال لنص يمكن ان يستبدل بنص اخر ",
                      size: 12,
                      color: ColorManager.black,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              MyText(
                title: "منذ : 5 دقائق",
                size: 10,
                color: ColorManager.grey2,
                fontWeight: FontWeight.normal,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

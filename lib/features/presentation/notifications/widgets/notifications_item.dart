import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/models/notifications_model.dart';
import 'package:flutter/material.dart';

class NotificationsItem extends StatelessWidget {
  final NotificationModel model;

  const NotificationsItem({Key? key, required this.model}) : super(key: key);
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
              url:model.logo ?? '',
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
                      title: model.body ?? '',
                      size: 12,
                      color: ColorManager.black,
                      fontWeight: FontWeight.w600,
                    )),
              ),
              SizedBox(
                height: 5,
              ),
              MyText(
                title: "منذ : ${model.createdAt}",
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

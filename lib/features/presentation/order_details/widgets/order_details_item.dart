import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/order_details_model.dart';

class OrderDetailsOrderItem extends StatelessWidget {
  final OrderDetailsModel? productsOrder;

  const OrderDetailsOrderItem({Key? key, required this.productsOrder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.9,
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
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
              title: tr(context, 'productDetails'),
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
                  url: "${productsOrder?.variant?.productImage}",
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
                      title: "${productsOrder?.variant?.productName}",
                      color: ColorManager.black,
                      size: 12,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        MyText(
                          title:
                              "الوزن : ${productsOrder?.variant?.variantWeight}",
                          color: ColorManager.black,
                          size: 12,
                          fontWeight: FontWeight.w700,
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: MyText(
                            title:
                                "${tr(context, "qty")}: ${productsOrder?.quantity}",
                            color: ColorManager.grey,
                            size: 10,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

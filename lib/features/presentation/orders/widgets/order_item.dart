import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/order_details/order_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/orders_model.dart';

class OrderItem extends StatelessWidget {
  final OrderData orderData;

  const OrderItem({Key? key, required this.orderData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>NavigationService.navigateTo(OrderDetailsView(id: orderData.id ?? 0,)),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 7,vertical: 5),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
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
                    "${orderData.products?.first.image ?? ''}",
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
                  Row(
                    children: [
                      MyText(
                        title: "رقم الطلب : #${orderData.orderNumber}",
                        color: ColorManager.black,
                        size: 13,
                      ),
                      Spacer(),
                      MyText(
                        title: "${orderData.createdAt?.substring(14,19)}",
                        color: ColorManager.grey,
                        size: 10,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ...List.generate(orderData.products?.length ?? 0, (index) => Column(
                    children: [
                      Row(
                        children: [
                          MyText(
                            title: "اسم المنتج : ",
                            color: ColorManager.grey,
                            size: 10,
                            fontWeight: FontWeight.normal,
                          ),
                          MyText(
                            title: "${orderData.products![index].name}",
                            color: ColorManager.grey,
                            size: 10,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Divider(
                      height: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AssetsManager.box),
                          SizedBox(
                            width: 5,
                          ),
                          MyText(
                            title: "الحالة : ",
                            color: ColorManager.grey,
                            size: 12,
                          ),
                          MyText(
                            title: "${orderData.orderStatus}",
                            color: ColorManager.primary,
                            size: 12,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          MyText(
                            title: "عرض المزيد",
                            color: ColorManager.black,
                            size: 10,
                            fontWeight: FontWeight.w600,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 15,
                            color: ColorManager.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

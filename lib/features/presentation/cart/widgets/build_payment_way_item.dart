import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/cart/models/payment_way_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuildPaymentWayItem extends StatelessWidget {
final PaymentWayModel model;
final GenericCubit<int> selectedCubit;

  const BuildPaymentWayItem({Key? key,  required this.selectedCubit, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color:selectedCubit.state.data == model.id ?ColorManager.selectedPaymentColor: ColorManager.offWhite,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(model.image,height: 25,),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(title: model.title,size: 12,color: ColorManager.black,),
              SizedBox(height: 5,),
              MyText(title: model.subTitle,size: 9,color: ColorManager.grey,fontWeight: FontWeight.normal,),
            ],
          ),
          Spacer(),
          selectedCubit.state.data == model.id ? SvgPicture.asset(AssetsManager.check,height: 25,) : const SizedBox(),
        ],
      ),
    );
  }
}

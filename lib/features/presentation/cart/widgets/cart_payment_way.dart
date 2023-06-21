import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/generic_cubit/generic_cubit.dart';
import '../../../../core/resource/color_manager.dart';
import '../models/payment_way_model.dart';
import 'build_payment_way_item.dart';

class CartPaymentWay extends StatelessWidget {
  final GenericCubit<int> selectPaymentWayCubit = GenericCubit(0);

  @override
  Widget build(BuildContext context) {
    List<PaymentWayModel> paymentList = [
      PaymentWayModel(
          id: 1,
          subTitle: 'الدفع بالبطاقة الائتمانية',
          title: 'بطاقة إئتمانية',
          image: AssetsManager.card),
      PaymentWayModel(
          id: 2,
          subTitle: 'الدفع عند الاستلام',
          title: 'الدفع كاش',
          image: AssetsManager.cash),
      PaymentWayModel(
          id: 3,
          subTitle: 'الدفع عند التحويل البنكي',
          title: 'تحويل بنكي',
          image: AssetsManager.bank),
    ];
    return Container(
      height: context.height * 0.4,
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
              title: "طريقة الدفع:",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          Divider(),
          BlocBuilder<GenericCubit<int>, GenericState<int>>(
            bloc: selectPaymentWayCubit,
            builder: (context, state) {
              return Column(
                children: List.generate(
                  paymentList.length,
                  (index) => InkWell(
                    onTap: () {
                      selectPaymentWayCubit.onUpdateData(paymentList[index].id);
                    },
                    child: BuildPaymentWayItem(
                      model: paymentList[index],
                      selectedCubit: selectPaymentWayCubit,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

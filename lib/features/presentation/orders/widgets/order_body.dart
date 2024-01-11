import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/orders/current_orders_cubit/current_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/custom_button.dart';
import '../../../../core/resource/navigation_service.dart';
import '../../auth/blocs/auth_cubit/auth_cubit.dart';
import '../../auth/screens/login/login_view.dart';
import 'order_item.dart';

class OrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var auth = context.read<AuthCubit>().state.authorized;

    return auth? BlocBuilder<CurrentOrdersCubit, CurrentOrdersState>(
      builder: (context, state) {
        if (state is CurrentOrdersSuccess) {
          return SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child:state.ordersModel.orderData?.length != 0 ? ListView.builder(
                itemCount: state.ordersModel.orderData?.length,
                itemBuilder: (context, index) {
                  return OrderItem(
                    orderData: state.ordersModel.orderData![index],
                  );
                },
              ) : Center(
                  child: MyText(
                    title: tr(context, "noData"),
                  ))
          );
        }
        return state is CurrentOrdersLoading
            ? Center(
            child: AppLoaderHelper.showSimpleLoading())
            : Center(
                child: MyText(
                title:tr(context, "noData"),
              ));
      },
    ):  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(title: "يجب تسجيل الدخول اولا",size: 18,),
          SizedBox(height: 15,),
          CustomButton(
            width: context.width*0.35,
            title: tr(context, "login"),
            onTap: () {
              NavigationService.navigateTo(LoginView());
            },
          )
        ],
      ),
    );
  }
}

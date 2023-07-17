import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/features/presentation/home/cubits/home_cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/resource/color_manager.dart';
import '../cart/cart_view.dart';
import '../cart/cubits/cart_cubit/cart_cubit.dart';
import '../home/home_view.dart';
import '../more/more_view.dart';
import '../orders/orders_view.dart';
import 'cubits/main_navigation_cubit.dart';

class MainNavigationBar extends StatefulWidget {
  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  Future<bool> onBackPressed() async {
    SystemNavigator.pop();
    return false;
  }

  final _pageNavigation = [
    BlocProvider(
      create: (context) => HomeCubit()..getHome(),
      child: HomeView(),
    ),
    OrdersView(),
    BlocProvider(
      create: (context) => CartCubit(),
      child: CartView(),
    ),
    MoreView()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPressed,
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: _buildBody(state),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: ColorManager.white,
              unselectedItemColor: Colors.white54,
              currentIndex: context.read<BottomNavCubit>().state,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                context.read<BottomNavCubit>().updateIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: context.read<BottomNavCubit>().state == 0
                        ? SvgPicture.asset(
                            AssetsManager.home,
                            height: 25,
                            color: ColorManager.primary,
                          )
                        : SvgPicture.asset(
                            AssetsManager.home,
                            height: 25,
                            color: ColorManager.grey2,
                          ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: context.read<BottomNavCubit>().state == 1
                        ? SvgPicture.asset(
                            AssetsManager.orders,
                            height: 25,
                            color: ColorManager.primary,
                          )
                        : SvgPicture.asset(
                            AssetsManager.orders,
                            height: 25,
                            color: ColorManager.grey2,
                          ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: context.read<BottomNavCubit>().state == 2
                        ? SvgPicture.asset(
                            AssetsManager.cartHome,
                            height: 25,
                            color: ColorManager.primary,
                          )
                        : SvgPicture.asset(
                            AssetsManager.cartHome,
                            height: 25,
                            color: ColorManager.grey2,
                          ),
                    label: ''),
                BottomNavigationBarItem(
                    icon: context.read<BottomNavCubit>().state == 3
                        ? SvgPicture.asset(
                            AssetsManager.more,
                            height: 25,
                            color: ColorManager.primary,
                          )
                        : SvgPicture.asset(
                            AssetsManager.more,
                            height: 25,
                            color: ColorManager.grey2,
                          ),
                    label: ''),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBody(int index) {
    return _pageNavigation.elementAt(index);
  }
}

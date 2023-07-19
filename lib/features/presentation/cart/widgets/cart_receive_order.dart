import 'dart:developer';

import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/features/presentation/cart/cubits/cart_cubit/cart_cubit.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/base_widgets/custom_drop_down.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/helpers/adaptive_picker.dart';
import '../../../../core/location_address/location_cubit/location_cubit.dart';
import '../../../../core/resource/color_manager.dart';

import '../../../models/city_model.dart';
import '../../../repos/repo_impl.dart';
import '../cubits/delivery_time_cubit/delivery_time_cubit.dart';
import 'build_receive_order_time_item.dart';

class CartReceiveOrder extends StatefulWidget {
  @override
  State<CartReceiveOrder> createState() => _CartReceiveOrderState();
}

class _CartReceiveOrderState extends State<CartReceiveOrder> {
  final LocationCubit locationCubit = LocationCubit();
  final GenericCubit<int> selectWayReceiveOrderCubit = GenericCubit(0);
  final GenericCubit<int> selectTimeReceiveOrderCubit = GenericCubit(0);
  final TextEditingController locationController = TextEditingController();
  final GenericCubit<List<CityModel>> citiesCubit = GenericCubit([]);
  final BaseRepo repo = RepoImpl();
  // void onLocationClick() async {
  //   var _loc = await Utils.getCurrentLocation();
  //   locationCubit.onLocationUpdated(LocationModel(
  //     lat: _loc?.latitude ?? 24.77426,
  //     lng: _loc?.longitude ?? 46.738586,
  //     address: "",
  //   ));
  //   Navigator.of(context).push(
  //     CupertinoPageRoute(
  //       builder: (_) => BlocProvider.value(
  //         value: locationCubit,
  //         child: LocationAddress(),
  //       ),
  //     ),
  //   );
  // }
  getCities() async {
    var cities = await repo.getCities();
    if (cities.isNotEmpty) {
      cities.insert(
          0, CityModel(id: 0, nameAr: "اختر المدينة", nameEn: "Choose City"));
      citiesCubit.onUpdateData(cities);
    }
  }



  @override
  void initState() {
    getCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<CartCubit>();
    void dateOrder(BuildContext context) {
      AdaptivePicker.datePicker(
        context: context,
        title: "تاريخ لتوصيل",
        onConfirm: (time) {
          cubit.dateController.text = time.toString().substring(0, 10);
        },
      );
    }
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
              title: "إستلام الطلب:",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          Divider(),
          BlocBuilder<GenericCubit<int>, GenericState<int>>(
            bloc: selectWayReceiveOrderCubit,
            builder: (context, state) {
              return Row(
                children: [
                  Radio<int>(
                      value: 0,
                      groupValue: state.data,
                      onChanged: (value) {
                        selectWayReceiveOrderCubit.onUpdateData(value!);
                        cubit.selectedReceivePlaceOrder =
                            selectWayReceiveOrderCubit.state.data;
                      }),
                  MyText(
                    title: "توصيل",
                    color: state.data == 0
                        ? ColorManager.black
                        : ColorManager.grey2,
                    size: 12,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Radio<int>(
                      value: 1,
                      groupValue: state.data,
                      onChanged: (value) {
                        selectWayReceiveOrderCubit.onUpdateData(value!);
                        cubit.selectedReceivePlaceOrder =
                            selectWayReceiveOrderCubit.state.data;
                      }),
                  MyText(
                    title: "إستلام من الفرع",
                    color: state.data == 1
                        ? ColorManager.black
                        : ColorManager.grey2,
                    size: 12,
                  ),
                ],
              );
            },
          ),
          CustomTextField(
            onTap: () => dateOrder(context),
            validator: (value) => value?.noValidate(),
            fieldTypes: FieldTypes.clickable,
            type: TextInputType.none,
            hint: "برجاء تحديد تاريخ التوصيل",
            controller: cubit.dateController,
            upperText: "تاريخ التوصيل",
          ),
          // BlocListener<LocationCubit, LocationState>(
          //   bloc: locationCubit,
          //   listener: (context, state) {
          //     locationController.text = state.model?.address ?? "";
          //   },
          //   child: BlocBuilder<LocationCubit, LocationState>(
          //     bloc: locationCubit,
          //     builder: (context, state) {
          //       if (state is LocationInitial) {
          //         return CustomTextField(
          //           onTap: () => onLocationClick(),
          //           validator: (value) => value?.noValidate(),
          //           fieldTypes: FieldTypes.clickable,
          //           type: TextInputType.none,
          //           controller: locationController,
          //           hint: "برجاء تحديد موقع التوصيل",
          //           upperText: "موقع التوصيل",
          //           suffixIcon: Icon(
          //             Icons.location_on_sharp,
          //             color: ColorManager.error,
          //           ),
          //         );
          //       }
          //       return state is LocationLoading
          //           ? AppLoaderHelper.showLoadingDialog()
          //           : CustomTextField(
          //               onTap: () => onLocationClick(),
          //               validator: (value) => value?.noValidate(),
          //               fieldTypes: FieldTypes.clickable,
          //               type: TextInputType.none,
          //               hint: "برجاء تحديد موقع التوصيل",
          //               upperText: "موقع التوصيل",
          //               suffixIcon: Icon(
          //                 Icons.location_on_sharp,
          //                 color: ColorManager.error,
          //               ),
          //             );
          //     },
          //   ),
          // ),
          BlocBuilder<GenericCubit<List<CityModel>>,
              GenericState<List<CityModel>>>(
            bloc: citiesCubit,
            builder: (context, state) {
              if (state is GenericUpdateState) {
                return DropdownButtonCustom<CityModel>(
                  hintText: "اختر بلد",
                  items: [
                    for (var item in state.data)
                      DropdownMenuItem<CityModel>(
                        value: item,
                        child: Text(
                          item.nameAr ?? '',
                        ),
                      )
                  ],
                  dropDownValue: state.data.first,
                  onChangeAction: (v) {
                    log("change : $v");
                    cubit.selectedCity = v;
                    log("change : ${cubit.selectedCity?.nameAr}");
                  },
                );
              }
              return Center(
                child: AppLoaderHelper.showSimpleLoading(),
              );
            },
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: MyText(
              title: "وقت التوصيل",
              color: ColorManager.black,
              size: 14,
            ),
          ),
          BlocProvider(
            create: (context) => DeliveryTimeCubit()..getDeliveryTime(),
            child: BlocBuilder<DeliveryTimeCubit, DeliveryTimeState>(
              builder: (context, state) {
                if (state is DeliveryTimeLoading) {
                  return Center(
                    child: AppLoaderHelper.showSimpleLoading(),
                  );
                } else {
                  if (state is DeliveryTimeSuccess) {
                    return BlocBuilder<GenericCubit<int>, GenericState<int>>(
                      bloc: selectTimeReceiveOrderCubit,
                      builder: (context, receiveOrderState) {
                        return Wrap(
                          children: List.generate(
                            state.timeList.length,
                            (index) => InkWell(
                                onTap: () {
                                  selectTimeReceiveOrderCubit
                                      .onUpdateData(index);
                                  cubit.selectedReceiveTimeOrder = state.timeList[index].id;
                                },
                                child: BuildReceiveOrderTimeItem(
                                  index: index,
                                  selectedCubit: selectTimeReceiveOrderCubit,
                                  model: state.timeList[index],
                                )),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: MyText(
                        title: "لا يوجد بيانات",
                      ),
                    );
                  }
                }
              },
            ),
          ),
          CustomTextField(
            validator: (value) => value?.noValidate(),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            hint: "في حالة وجود ملاحظات أضف هنا",
            upperText: "ملاحظاتك",
            maxLines: 3,
            controller: cubit.notesController,
          ),
        ],
      ),
    );
  }
}

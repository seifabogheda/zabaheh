import 'dart:developer';

import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/add_to_cart_model.dart';
import '../../../models/product_model.dart';
import '../cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import '../cubits/product_details/product_details_cubit.dart';

class AllAddition extends StatefulWidget {
  final List<Options> options;

  const AllAddition({Key? key, required this.options}) : super(key: key);

  @override
  State<AllAddition> createState() => _AllAdditionState();
}

class _AllAdditionState extends State<AllAddition> {
  // Cubits الخاصة بالكمية وغيره موجودة
  final GenericCubit<int> quantityCubit = GenericCubit(0);
  final GenericCubit<int> sacrificeType = GenericCubit(0);

  // Map لتخزين الحالة لكل type
  Map<String, int> selectedRadioForType = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<int>, GenericState<int>>(
      bloc: sacrificeType,
      builder: (context, sacrificeState) {
        return Container(
          padding: const EdgeInsets.all(10),
          color: ColorManager.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                title: "نوع الذبيحة",
                size: 16,
                fontWeight: FontWeight.bold,
                color: ColorManager.black,
              ),
              // خيارات الذبيحة
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: 1,
                          groupValue: sacrificeState.data,
                          onChanged: (value) {
                            sacrificeType.onUpdateData(value!);
                          },
                        ),
                        MyText(
                          title: 'حي',
                          size: 16,                            color: ColorManager.black,

                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Radio<int>(
                          value: 2,
                          groupValue: sacrificeState.data,
                          onChanged: (value) {
                            sacrificeType.onUpdateData(value!);
                          },
                        ),
                        MyText(
                          title: 'مذبوح',                            color: ColorManager.black,

                          size: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              if (sacrificeState.data == 2) ...[
                MyText(
                  title: "الاضافات",
                  size: 16,
                  fontWeight: FontWeight.bold,
                  color: ColorManager.black,
                ),
                Column(
                  children: context
                      .read<ProductDetailsCubit>()
                      .groupedOptions
                      .entries
                      .map((entry) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MyText(
                            title: entry.key,
                            size: 18,
                            color: ColorManager.black,
                          ),
                        ),
                        ...List.generate(entry.value.length, (index) {
                          final option = entry.value[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 4.0, horizontal: 8.0),
                            child: entry.key == "مفروم"
                                ? Row(
                                    children: [
                                      Radio<int>(
                                        value: option.id ?? 0,
                                        groupValue:
                                            selectedRadioForType[option.type] ??
                                                0,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedRadioForType[option.type!] =
                                                value!;
                                          });
                                        },
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            title: option.name ?? '',
                                            size: 16,
                                            color: ColorManager.grey,
                                          ),
                                          const SizedBox(height: 5),
                                          MyText(
                                            title:
                                                "سعر كيلو المفروم ${option.price} ر.س",
                                            size: 13,
                                            color: ColorManager.grey,
                                          ),
                                          BlocBuilder<GenericCubit<int>,
                                              GenericState<int>>(
                                            bloc: quantityCubit,
                                            builder: (context, state) {
                                              return Container(
                                                width: 200,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 7),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5, vertical: 7),
                                                decoration: BoxDecoration(
                                                  color: ColorManager.white,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      onTap: () async {
                                                        await quantityCubit
                                                            .onUpdateData(
                                                                state.data + 1);
                                                        context
                                                            .read<
                                                                AddToCartCubit>()
                                                            .addOption(
                                                              OptionsCart(
                                                                optionId:
                                                                    option.id,
                                                                type: option.type,
                                                                quantity:
                                                                    quantityCubit
                                                                        .state
                                                                        .data,
                                                              ),
                                                            );
                                                      },
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            ColorManager
                                                                .secondary,
                                                        child: MyText(
                                                          title: "+",
                                                          size: 25,
                                                          color: ColorManager
                                                              .white,
                                                        ),
                                                      ),
                                                    ),
                                                    MyText(
                                                      title: "${state.data}",
                                                      size: 18,
                                                      color: ColorManager.black,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        if (quantityCubit
                                                                .state.data >
                                                            0) {
                                                          quantityCubit
                                                              .onUpdateData(
                                                                  state.data -
                                                                      1);
                                                          // context
                                                          //     .read<AddToCartCubit>()
                                                          //     .removeOption(
                                                          //   option.id,
                                                          //   quantityCubit.state.data,
                                                          // );
                                                        }
                                                      },
                                                      child: CircleAvatar(
                                                        backgroundColor:
                                                            ColorManager
                                                                .offWhite,
                                                        child: MyText(
                                                          title: "-",
                                                          size: 25,
                                                          color:
                                                              ColorManager.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Radio<int>(
                                        value: option.id ?? 0,
                                        groupValue:
                                            selectedRadioForType[option.type] ??
                                                0,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedRadioForType[option.type!] =
                                                value!;
                                          });
                                          context
                                              .read<AddToCartCubit>()
                                              .addOption(
                                                OptionsCart(
                                                  optionId: option.id,
                                                  type: option.type,
                                                  quantity: 1,
                                                ),
                                              );
                                        },
                                      ),
                                      MyText(
                                        title: option.name ?? '',
                                        size: 16,
                                        color: ColorManager.grey,
                                      ),
                                      Spacer(),
                                      MyText(
                                        title: "${option.price} ر.س",
                                        size: 15,
                                        color: ColorManager.grey,
                                      ),
                                    ],
                                  ),
                          );
                        }),
                        Divider(),
                      ],
                    );
                  }).toList(),
                )
              ],
            ],
          ),
        );
      },
    );
  }
}

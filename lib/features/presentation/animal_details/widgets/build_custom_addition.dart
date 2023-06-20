import 'dart:developer';

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_widgets/custom_drop_down.dart';

class BuildCustomAddition extends StatelessWidget {
  final List<String> minced = ["1 كيلو", "2 كيلو", "3 كيلو", "برجاء تحديد كمية المفروم"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start  ,
        children: [
          MyText(title: "كمية المفروم",color: ColorManager.black,size: 14,),
          DropdownButtonCustom<String>(
            // hintText: "اختر بلد",
            items: [
              for (var item in minced)
                DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                  ),
                )
            ],
            dropDownValue: minced.last,
            onChangeAction: (v) {
              log("change : $v");
            },
          ),
          MyText(title: "سعر كيلو اللحم المفروم : 20 ريال سعودي",color: ColorManager.error,size: 12,),

        ],
      ),
    );
  }
}

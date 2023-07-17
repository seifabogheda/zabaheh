import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/animal_item.dart';
import 'package:flutter/material.dart';

import '../../../models/product_model.dart';

class SearchBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          CustomTextField(
            validator: (value) => value?.noValidate(),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.text,
            hint: "ابحث عما تريد...",
            suffixIcon: Icon(Icons.search),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 10),
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: MyText(
                            title: "حاشي بلدي",
                            size: 16,
                            color: ColorManager.black,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.start,
                    ),
                    SizedBox(height: 15,),
                    ...List.generate(2, (index) =>AnimalItem(product: Products(),),),
                    SizedBox(height: 15,),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class CustomStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            3,
            (index) => StepperComponent(),
          ),
        ),
      ],
    );
  }
}

class StepperComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 12,
              backgroundColor: ColorManager.grey,
            ),
            Expanded(
              child: Container(
                height: 2,
                color: ColorManager.grey,
              ),
            ),
          ],
        ),
        MyText(title: "title"),
      ],
    ));
  }
}

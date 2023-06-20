import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ActiveForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PinCodeTextField(
            length: 4,
            appContext: context,
            onChanged: (String value) {},
            backgroundColor: Colors.transparent,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                inactiveColor: ColorManager.black,
                activeColor: ColorManager.black,
                selectedFillColor: ColorManager.white,
                inactiveFillColor: ColorManager.white,
                activeFillColor: ColorManager.white,
                disabledColor: ColorManager.black),
            animationDuration: Duration(milliseconds: 300),
            enableActiveFill: true,
            // controller: activeAccountData.code,
          ),
        ),
      ),
    );
  }
}

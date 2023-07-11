import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/animal_details/widgets/build_animal_body.dart';
import 'package:flutter/material.dart';

class AnimalDetailsView extends StatelessWidget {
  final String title;

  const AnimalDetailsView({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
      title: title,
      needBack: true,
      scaffoldColor: ColorManager.offWhite,
      textColor: ColorManager.green,
      child: BuildAnimalBody(),
      bottomNavigationBar: Container(
        color: ColorManager.white,
        child: CustomButton(title: 'أضف للسلة',onTap: (){},),
      ),
    );
  }
}

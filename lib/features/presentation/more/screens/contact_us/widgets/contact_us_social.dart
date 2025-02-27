import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/utils/utils_imports.dart';
import 'package:base_flutter/features/presentation/more/cubits/contact_us_cubit/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(title: "تواصل معنا عبر الميل او الواتساب",
        fontWeight: FontWeight.bold,
        size: 20,color: ColorManager.black,),
        const SizedBox(height: 50,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Utils.launchWhatsApp(
                    context.read<ContactUsCubit>().state.settings?.phone);
              },
              child: SvgPicture.asset(AssetsManager.whatsapp),
            ),
            SizedBox(
              width: 15,
            ),
            InkWell(
              onTap: () {
                Utils.sendMail(
                    context.read<ContactUsCubit>().state.settings?.email ?? '');
              },
              child: SvgPicture.asset(AssetsManager.gmail),
            ),
          ],
        ),
      ],
    );
  }
}

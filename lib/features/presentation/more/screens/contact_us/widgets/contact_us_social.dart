import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/utils/utils_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactUsSocial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Utils.launchURL(url: "https://twitter.com/abogheda72");
          },
          child: SvgPicture.asset(AssetsManager.twitter),
        ),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            Utils.launchWhatsApp("01002348032");
          },
          child: SvgPicture.asset(AssetsManager.whatsapp),
        ),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            Utils.sendMail("seifabogheda89@gmail.com");
          },
          child: SvgPicture.asset(AssetsManager.gmail),
        ),
      ],
    );
  }
}

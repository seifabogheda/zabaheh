import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

import 'contact_us_form.dart';
import 'contact_us_social.dart';

class ContactUsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ContactUsForm(),
          CustomButton(
            title: tr(context,"send"),
            onTap: () {},
            margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          ),
          ContactUsSocial(),
        ],
      ),
    );
  }
}



import 'package:base_flutter/features/presentation/more/screens/contact_us/widgets/contact_us_body.dart';
import 'package:flutter/material.dart';

import '../../widgets/more_scaffold.dart';

class ContactUsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: "تواصل معنا",
      body: ContactUsBody(),
    );
  }
}

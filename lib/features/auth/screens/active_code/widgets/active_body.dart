import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:base_flutter/features/auth/screens/active_code/widgets/active_image.dart';
import 'package:base_flutter/features/auth/screens/active_code/widgets/active_texts.dart';
import 'package:base_flutter/features/auth/screens/active_code/widgets/receive_code.dart';
import 'package:flutter/material.dart';

import 'active_form.dart';

class ActiveBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ActiveImage(),
              ActiveTexts(),
              ActiveForm(),
              ReceiveCode(),
              CustomButton(title: tr("confirm"),onTap: (){},width: context.width*0.8,),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:base_flutter/features/presentation/notifications/widgets/notifications_body.dart';
import 'package:flutter/material.dart';

import '../../../core/resource/color_manager.dart';
import '../../custom_widgets/auth_custom_appbar.dart';

class NotificationsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
      title: 'الاشعارات',
      child: NotificationsBody(),
      needBack: true,
      scaffoldColor: ColorManager.offWhite,
    );
  }
}

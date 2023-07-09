
import 'package:flutter/material.dart';

import '../../core/resource/assets_manager.dart';

class LogoWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsManager.splashLogo,height: 190,width: 190,);
  }
}

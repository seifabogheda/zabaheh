


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/resource/assets_manager.dart';


class ActiveImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetsManager.code,height: 150,width: 150,);
  }
}

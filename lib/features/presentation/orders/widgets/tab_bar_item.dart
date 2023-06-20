
import 'package:flutter/material.dart';

import '../../../../core/resource/color_manager.dart';

class TabBarItem extends StatelessWidget {
final String title;

  const TabBarItem({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
      ),
      alignment: Alignment.center,
      child: Text(title),
    )
    ;
  }
}

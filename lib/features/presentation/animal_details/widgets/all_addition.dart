
import 'package:flutter/material.dart';

import 'build_addition_item.dart';
import 'build_custom_addition.dart';
import 'build_qty.dart';

class AllAddition extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildAdditionItem(),
        BuildAdditionItem(),
        BuildAdditionItem(),
        BuildCustomAddition(),
        BuildQty(),
      ],
    );
  }
}

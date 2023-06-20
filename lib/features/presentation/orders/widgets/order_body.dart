import 'package:flutter/material.dart';

import 'order_item.dart';

class OrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return OrderItem();
            },),);
  }
}

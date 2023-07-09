import 'package:flutter/material.dart';

import 'order_item.dart';

class OrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:MediaQuery.of(context).size.height*0.85,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return OrderItem();
        },
      ),
    );
  }
}

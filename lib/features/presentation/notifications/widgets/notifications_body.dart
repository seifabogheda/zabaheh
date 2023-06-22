import 'package:flutter/material.dart';

import 'notifications_item.dart';

class NotificationsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        itemCount: 10,
        itemBuilder: (context, index) {
          return NotificationsItem();
        },
      ),
    );
  }
}

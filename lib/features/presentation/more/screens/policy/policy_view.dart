

import 'package:base_flutter/features/presentation/more/screens/policy/widgets/policy_body.dart';
import 'package:flutter/material.dart';

import '../../widgets/more_scaffold.dart';

class PolicyView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MoreScaffold(
      titleScreen: "سياسية الخصوصية",
      body: PolicyBody(),
    );
  }
}

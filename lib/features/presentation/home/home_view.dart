import 'package:base_flutter/features/presentation/home/widgets/home_app_bar.dart';
import 'package:base_flutter/features/presentation/home/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}

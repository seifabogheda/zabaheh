import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/utils_imports.dart';




class Splash extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>_SplashState();
}

class _SplashState extends State<Splash> {

  GlobalKey<ScaffoldState> _scaffold = new GlobalKey<ScaffoldState>();


  @override
  void initState() {
    _checkingData();
    super.initState();
  }

  _checkingData()async{
    Future.delayed(Duration(milliseconds: 500,),(){
      Utils.manipulateSplashData(context);
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffold,
        backgroundColor: ColorManager.white,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: AppMargin.m14),
                  height: 180,
                  width: context.width * 0.3 ,
                  child: Image(
                    image: AssetImage(AssetsManager.splashLogo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
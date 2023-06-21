import 'package:flutter/material.dart';

class UIHelper {
  static showBottomSheet(
      {required BuildContext context,
      required AnimationController controller,
      double? height,
      required Widget child,
      Radius? radius}) {
    return showModalBottomSheet(
      context: context,
      transitionAnimationController: controller,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: radius ?? Radius.circular(10.0),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          height: height ?? MediaQuery.of(context).size.height * 0.4,
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: child,
          ),
        );
      },
    );
  }

  static showDialog(
      {required BuildContext context, required Widget child, double? radius,double? height,Widget? title}) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius ?? 15.0),
            ),
          ),
          title: title ?? const SizedBox(),
          content: Container(
            height: height ?? 200,
            child: child,
          ),
        );
      },
      barrierDismissible: true,
      barrierLabel: '',
      barrierColor: Colors.black38,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}

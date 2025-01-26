import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  static BuildContext? currentContext = navigatorKey.currentContext;

  static Route<dynamic> _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
  static Route<dynamic> _cupertinoPageRoute(Widget page) =>
      CupertinoPageRoute(builder: (_) => page);

  static Future<dynamic>? navigateTo(Widget page) {
    if (Platform.isAndroid) {
      return navigatorKey.currentState!.push(_materialPageRoute(page));
    } else {
      return navigatorKey.currentState!.push(_cupertinoPageRoute(page));
    }
  }

  static void back() {
    return navigatorKey.currentState?.pop();
  }

  static Future<dynamic>? navigateAndReplacement(Widget page) {
    if (Platform.isAndroid) {
      return navigatorKey.currentState
          ?.pushReplacement(_materialPageRoute(page));
    } else {
      return navigatorKey.currentState
          ?.pushReplacement(_cupertinoPageRoute(page));
    }
  }

  static Future<dynamic>? removeUntil(Widget page) {
    if (Platform.isAndroid) {
      return navigatorKey.currentState?.pushAndRemoveUntil(
        _materialPageRoute(page),
        (_) => false,
      );
    } else {
      return navigatorKey.currentState?.pushAndRemoveUntil(
        _cupertinoPageRoute(page),
        (_) => false,
      );
    }
  }
}

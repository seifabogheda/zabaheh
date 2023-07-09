import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';

extension Validator on String {

  String? noValidate() {
    return null;
  }

  String? validateEmpty(BuildContext context,{String? message}) {
    if (this.trim().isEmpty) {
      return message ?? tr(context,"fillField");
    }
    return null;
  }

  String? validatePassword(BuildContext context,{String? message}) {
    if (this.trim().isEmpty) {
      return message ?? tr(context,"fillField");
    } else if (this.length < 8) {
      return message ?? tr(context,"passValidation");
    }
    return null;
  }

  String? validateEmail(BuildContext context,{String? message}) {
    if (this.trim().isEmpty) {
      return message ?? tr(context,"fillField");
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this)) {
      return message ?? tr(context,"mailValidation");
    }
    return null;
  }

  String? validateEmailORNull(BuildContext context,{String? message}) {
    if (this.trim().isNotEmpty) {
      if (!RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(this)) {
        return message ?? tr(context,"mailValidation");
      }
    }
    return null;
  }

  String? validatePhone(BuildContext context,{String? message}) {
    if (this.trim().isEmpty) {
      return message ?? tr(context,"fillField");
    } else if (this.length != 9) {
      return message ?? tr(context,"phoneValidation");
    }
    return null;
  }

  String? validatePasswordConfirm(BuildContext context,{required String pass, String? message}) {
    if (this.trim().isEmpty) {
      return message ?? tr(context,"fillField");
    } else if (this != pass) {
      return message ?? tr(context,"confirmValidation");
    }
    return null;
  }
}

extension ValidatorDrop<DataType> on DataType {
  String? validateDropDown(BuildContext context,{String? message}) {
    if (this == null) {
      return message ?? tr(context,"fillField");
    }
    return null;
  }
}

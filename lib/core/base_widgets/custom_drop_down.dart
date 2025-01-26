// ignore_for_file: file_names

import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/font_manager.dart';
import 'package:flutter/material.dart';

import '../resource/value_manager.dart';

class DropdownButtonCustom<T> extends StatelessWidget {
  final T? dropDownValue;
  final List<DropdownMenuItem<T>>? items;
  final InputDecoration? decoration;
  final void Function(dynamic)? onChangeAction;
  final String? Function(T?)? validator;
  final String hintText;
  final Color? color;
  final double? fontSize;
  final Function()? onTap;

  const DropdownButtonCustom({
    Key? key,
    this.decoration,
    this.dropDownValue,
    this.items,
    this.onChangeAction,
    this.validator,
    this.hintText = "",
    this.color,
    this.fontSize,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: AppMargin.m4),
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p8,
        horizontal: AppPadding.p8,
      ),
      child: DropdownButtonFormField<T>(
        decoration: decoration ??
            InputDecoration(
              fillColor: ColorManager.grey1,
              labelText: hintText,
              labelStyle: TextStyle(
                color: color ?? ColorManager.primary,
                fontSize: fontSize ?? 20,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 15,
              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorManager.grey.withValues(alpha:.8), width: 1),
                  borderRadius: BorderRadius.circular(4)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: ColorManager.grey, width: 2)),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: ColorManager.grey.withValues(alpha:.5), width: 1),
                  borderRadius: BorderRadius.circular(4)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: const BorderSide(color: Colors.red, width: 2)),
            ),
        isDense: false,
        validator: validator,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: FontConstants.fontFamily,
        ),
        onTap: onTap,
        value: dropDownValue,
        icon: Icon(Icons.arrow_drop_down_sharp),
        items: items,
        onChanged: onChangeAction,
      ),
    );
  }
}
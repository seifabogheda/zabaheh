import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import '../resource/font_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';
import 'my_text.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? upperText;
  final String? label;
  final TextInputAction? textInputAction;
  final FieldTypes fieldTypes;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType type;
  final bool readOnly;
  final bool? autoFocus;
  final int? maxLines;
  final double? width;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  const CustomTextField({
    this.controller,
    this.hint,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    this.readOnly = false,
    this.label,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    required this.fieldTypes,
    required this.type,
    this.suffixIcon,
    this.prefixIcon,
    this.width,
    this.focusNode,
    this.autoFocus, this.upperText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: AppMargin.m8,horizontal: AppMargin.m2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyText(
            title: upperText ?? '',
            size: 14,
            fontWeight: FontWeight.w600,
            color: ColorManager.black,

          ),
          Container(
            width: width,
            padding: const EdgeInsets.symmetric(
              vertical: AppPadding.p8,
              horizontal: AppPadding.p4,
            ),
            child: InkWell(
              onTap: onTap,
              child: AbsorbPointer(
                absorbing: fieldTypes == FieldTypes.clickable,
                child: TextFormField(
                  autofocus: autoFocus ?? false,
                  focusNode: focusNode,
                  controller: controller,
                  textInputAction: textInputAction,
                  keyboardType: type,
                  readOnly: readOnly,
                  maxLines: maxLines,
                  obscureText: fieldTypes == FieldTypes.password,
                  autofillHints: getAutoFillHints(type),
                  onChanged: onChanged,
                  onFieldSubmitted: onFieldSubmitted,
                  validator: validator,
                  style: getMediumStyle(
                      color: ColorManager.primary, fontSize: FontSize.s12),
                  decoration: InputDecoration(
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorManager.grey2, width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: ColorManager.primary, width: 2)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: ColorManager.grey.withValues(alpha:.5), width: 1),
                        borderRadius: BorderRadius.circular(5)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.red, width: 2)),
                    labelText: label,
                    labelStyle: TextStyle(color: ColorManager.grey),
                    hintText: hint,
                    hintStyle: TextStyle(color: ColorManager.grey1),
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    filled: true,
                    fillColor: ColorManager.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> getAutoFillHints(TextInputType inputType) {
  if (inputType == TextInputType.emailAddress) {
    return [AutofillHints.email];
  } else if (inputType == TextInputType.datetime) {
    return [AutofillHints.birthday];
  } else if (inputType == TextInputType.phone) {
    return [AutofillHints.telephoneNumber];
  } else if (inputType == TextInputType.url) {
    return [AutofillHints.url];
  }
  return [AutofillHints.name, AutofillHints.username];
}

enum FieldTypes { normal, clickable, readonly, chat, password, rich, disable }
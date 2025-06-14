import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'localization/localization.dart';
import 'resources.dart';

class AppDecoration {
  BoxDecoration listItemDecoration({Color? backgroundColor, double? radius}) {
    return BoxDecoration(
        color: backgroundColor ?? R.colors.primaryColorWithOpacity,
        borderRadius: BorderRadius.circular(radius ?? 8));
  }

  BoxDecoration imageDecoration(
      {Color? backgroundColor, required String imagePath, double? radius}) {
    return BoxDecoration(
      color: backgroundColor ?? R.colors.primaryColorWithOpacity,
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage(imagePath),
      ),
      boxShadow: [
        BoxShadow(
            color: R.colors.blackWithOpacity,
            spreadRadius: 2,
            blurRadius: 5,
            blurStyle: BlurStyle.outer)
      ],
    );
  }

  BoxDecoration imageDecoration2(
      {Color? backgroundColor, required String imagePath, double? radius}) {
    return BoxDecoration(
        color: backgroundColor ?? R.colors.primaryColorWithOpacity,
        image: DecorationImage(
          image: AssetImage(imagePath),
        ),
        boxShadow: [
          BoxShadow(
              color: R.colors.blackWithOpacity,
              spreadRadius: 2,
              blurRadius: 5,
              blurStyle: BlurStyle.outer)
        ],
        borderRadius: BorderRadius.circular(radius ?? 12));
  }

  BoxDecoration linearGradient() {
    return BoxDecoration(
        gradient: LinearGradient(colors: [
      R.colors.transparent,
      R.colors.primaryColorWithOpacity,
      R.colors.transparent,
    ]));
  }

  BoxDecoration shadowDecoration(
      {required double radius, Color? background, Color? shadowColor}) {
    return BoxDecoration(
        color: background ?? R.colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: [
          BoxShadow(
              color: shadowColor ?? R.colors.blackWithOpacity,
              spreadRadius: 2,
              blurRadius: 5,
              blurStyle: BlurStyle.outer)
        ]);
  }

  BoxDecoration shadowCircleDecoration(
      {Color? background, Color? shadowColor, Color? borderColor}) {
    return BoxDecoration(
        shape: BoxShape.circle,
        color: background ?? R.colors.transparent,
        border:
            Border.all(color: borderColor ?? R.colors.secondaryColor, width: 2),
        boxShadow: [
          BoxShadow(
              color: shadowColor ?? R.colors.blackWithOpacity,
              spreadRadius: 2,
              blurRadius: 5,
              blurStyle: BlurStyle.outer)
        ]);
  }

  InputDecoration fieldDecoration({
    Widget? preIcon,
    required String hintText,
    Widget? suffixIcon,
    double? radius,
    double? horizontalPadding,
    double? verticalPadding,
    double? iconMinWidth,
    Color? fillColor,
    FocusNode? focusNode,
    TextStyle? hintTextStyle,
    Color? hintColor,
  }) {
    return InputDecoration(
      prefixIconConstraints: BoxConstraints(
        minWidth: iconMinWidth ?? 42,
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16, vertical: verticalPadding ?? 16),
      fillColor: fillColor ?? R.colors.white,
      hintText: LocalizationMap.getTranslatedValues(hintText),
      prefixIcon: preIcon,
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
      hintStyle: hintTextStyle ??
          R.textStyles.montserrat(
            color: hintColor ?? R.colors.hintColor,
            fontSize: 12.sp,
            fontWeight: focusNode?.hasFocus ?? false
                ? FontWeight.w500
                : FontWeight.w300,
          ),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide.none,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.red),
      ),
      filled: true,
    );
  }

  InputDecoration searchFieldDecoration({
    Widget? preIcon,
    required String hintText,
    Widget? suffixIcon,
    double? radius,
    double? horizontalPadding,
    double? verticalPadding,
    double? iconMinWidth,
    Color? fillColor,
    FocusNode? focusNode,
  }) {
    return InputDecoration(
      prefixIconConstraints: BoxConstraints(
        minWidth: iconMinWidth ?? 42,
      ),
      contentPadding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 16, vertical: verticalPadding ?? 16),
      fillColor: fillColor ?? R.colors.white,
      hintText: hintText,
      prefixIcon: preIcon,
      suffixIcon: suffixIcon != null ? Container(child: suffixIcon) : null,
      hintStyle: R.textStyles.poppins(
        color: R.colors.hintColor,
        fontSize: 12.sp,
        fontWeight:
            focusNode?.hasFocus ?? false ? FontWeight.w400 : FontWeight.w300,
      ),
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.hintColor),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.blackWithOpacity),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.blackWithOpacity),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.blackWithOpacity),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.blackWithOpacity),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        borderSide: BorderSide(color: R.colors.blackWithOpacity),
      ),
      filled: true,
    );
  }
}

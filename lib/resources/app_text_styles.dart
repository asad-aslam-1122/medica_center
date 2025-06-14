import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_center/resources/resources.dart';
import 'package:sizer/sizer.dart';

class AppTextStyles {
  TextStyle poppins(
      {Color? color,
      double? fontSize,
      FontWeight? fontWeight,
      double? letterSpacing,
      double? height,
      bool? isUnderLine}) {
    return GoogleFonts.poppins(
        fontSize: fontSize ?? 12.sp,
        color: color ?? R.colors.black,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: letterSpacing ?? 0.48,
        height: height ?? 0,
        decoration: isUnderLine == true
            ? TextDecoration.underline
            : TextDecoration.none,
        decorationThickness: 1.8,
        decorationColor: R.colors.black);
  }

  TextStyle montserrat({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize ?? 11.sp,
      color: color ?? R.colors.black,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0.48,
      height: height ?? 0,
    );
  }

  TextStyle playFair({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    double? height,
  }) {
    return GoogleFonts.playfair(
      fontSize: fontSize ?? 12.sp,
      color: color ?? R.colors.black,
      fontWeight: fontWeight ?? FontWeight.w400,
      letterSpacing: letterSpacing ?? 0.48,
      height: height ?? 0,
    );
  }
}

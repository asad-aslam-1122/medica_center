import 'package:flutter/material.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/resources.dart';

class GlobalWidget {
  static Widget itemGeneratedList(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 12,
      ),
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: R.decoration.listItemDecoration(
          backgroundColor: R.colors.primaryColorWithOpacity, radius: 6),
      child: Text(
        LocalizationMap.getTranslatedValues(title),
        style: R.textStyles.poppins(
            fontSize: 12.sp,
            color: R.colors.primaryColor,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  static Widget customTextField(
      {required BuildContext context,
      required FocusNode currentFocusNode,
      required TextEditingController controller,
      required String hintText,
      VoidCallback? onTab,
      Widget? suffixIcon,
      FocusNode? nextFocusNode,
      bool readOnly = false,
      TextInputAction? inputAction}) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: R.decoration.shadowDecoration(radius: 40),
      child: TextFormField(
        onTap: onTab ?? () {},
        readOnly: readOnly,
        textInputAction: inputAction ?? TextInputAction.next,
        onFieldSubmitted: nextFocusNode != null
            ? (value) {
                FocusScope.of(context).requestFocus(nextFocusNode);
              }
            : (value) {},
        style: R.textStyles.poppins(
            fontSize: 13.sp, fontWeight: FontWeight.w300, isUnderLine: false),
        focusNode: currentFocusNode,
        autofocus: false,
        controller: controller,
        decoration: R.decoration.fieldDecoration(
            hintText: hintText,
            radius: 40,
            suffixIcon: suffixIcon ?? const SizedBox()),
      ),
    );
  }

  static Widget customButton({
    required String title,
    required VoidCallback onPressed,
    Color? textColor,
    Color? backGroundColor,
    double? textSize,
    double? borderRadius,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius ?? 12),
              side: BorderSide.none)),
          backgroundColor: WidgetStatePropertyAll(
              backGroundColor ?? R.colors.secondaryColor)),
      child: Text(
        LocalizationMap.getTranslatedValues(title),
        style: R.textStyles.poppins(
            fontSize: textSize ?? 14.sp,
            color: textColor ?? R.colors.white,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

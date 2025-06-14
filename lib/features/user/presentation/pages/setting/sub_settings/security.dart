import 'package:flutter/material.dart';
import 'package:medical_center/features/global/widgets/custom_switch_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/localization/localization.dart';
import '../../../../../../resources/resources.dart';
import '../../../../../global/widgets/global_widget.dart';

class Security extends StatefulWidget {
  const Security({super.key});

  @override
  State<Security> createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: R.colors.white,
      child: SizedBox(
        height: mediaQuery.size.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                LocalizationMap.getTranslatedValues("security"),
                style: R.textStyles
                    .poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lock,
                    color: R.colors.black,
                    size: 22,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    LocalizationMap.getTranslatedValues("enable_pin"),
                    style: R.textStyles.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: R.colors.black),
                  ),
                  const Spacer(),
                  Expanded(
                    child: CustomSwitchButton(
                      value: true,
                      onChanged: (value) {},
                    ),
                  )
                ],
              ),
              const SizedBox(),
              Text(
                LocalizationMap.getTranslatedValues("create_pin"),
                style: R.textStyles.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: R.colors.black),
              ),
              flutterOtpFields(),
              Text(
                LocalizationMap.getTranslatedValues("confirm_pin"),
                style: R.textStyles.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: R.colors.black),
              ),
              flutterOtpFields(),
              SizedBox(
                  height: 50,
                  width: mediaQuery.size.width,
                  child: GlobalWidget.customButton(
                      title: "done",
                      onPressed: () {
                        Navigator.pop(context);
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Widget flutterOtpFields() {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        selectedFillColor: R.colors.primaryColorWithOpacity.withOpacity(0.2),
        inactiveColor: R.colors.hintColor,
        activeColor: R.colors.hintColor,
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 45,
        inactiveFillColor: R.colors.blackWithOpacity.withOpacity(0.1),
        borderWidth: 0,
        activeBorderWidth: 0,
        disabledBorderWidth: 0,
        inactiveBorderWidth: 0,
        selectedBorderWidth: 0,
        selectedColor: R.colors.primaryColorWithOpacity.withOpacity(0.1),
        activeFillColor: R.colors.blackWithOpacity.withOpacity(0.1),
      ),
      animationDuration: const Duration(milliseconds: 300),
      backgroundColor: R.colors.white,
      enableActiveFill: true,
      textStyle: R.textStyles.poppins(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: R.colors.black,
      ),
      // errorAnimationController: errorController,
      // controller: textEditingController,
      onCompleted: (v) {},
      onChanged: (value) {},
      keyboardType: TextInputType.number,
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}

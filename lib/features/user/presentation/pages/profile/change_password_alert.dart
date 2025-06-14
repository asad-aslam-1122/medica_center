import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/localization/localization.dart';
import '../../../../../../resources/resources.dart';
import '../../../../global/widgets/global_widget.dart';

class ChangePasswordAlert extends StatefulWidget {
  const ChangePasswordAlert({super.key});

  @override
  State<ChangePasswordAlert> createState() => _ChangePasswordAlertState();
}

class _ChangePasswordAlertState extends State<ChangePasswordAlert> {
  TextEditingController oldPasswordTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  TextEditingController confirmPasswordTC = TextEditingController();

  FocusNode oldPasswordFN = FocusNode();
  FocusNode passwordFN = FocusNode();
  FocusNode confirmPasswordFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: R.colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: SizedBox(
            height: mediaQuery.size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    LocalizationMap.getTranslatedValues("change_password"),
                    style: R.textStyles
                        .poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                ),
                GlobalWidget.customTextField(
                    hintText: "current_password",
                    context: context,
                    controller: oldPasswordTC,
                    currentFocusNode: oldPasswordFN,
                    nextFocusNode: passwordFN),
                GlobalWidget.customTextField(
                    hintText: "new_password",
                    context: context,
                    controller: passwordTC,
                    currentFocusNode: passwordFN,
                    nextFocusNode: confirmPasswordFN),
                GlobalWidget.customTextField(
                  hintText: "confirm_password",
                  context: context,
                  controller: confirmPasswordTC,
                  currentFocusNode: confirmPasswordFN,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    height: 50,
                    width: mediaQuery.size.width,
                    child: GlobalWidget.customButton(
                        title: "change_password",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        borderRadius: 12),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

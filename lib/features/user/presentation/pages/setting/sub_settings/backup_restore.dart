import 'package:flutter/material.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/localization/localization.dart';
import '../../../../../../resources/resources.dart';

class BackupRestore extends StatefulWidget {
  const BackupRestore({super.key});

  @override
  State<BackupRestore> createState() => _BackupRestoreState();
}

class _BackupRestoreState extends State<BackupRestore> {
  String? selectedOptions = LocalizationMap.getTranslatedValues('sd_card');

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: R.colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SizedBox(
            height: mediaQuery.size.height * 0.33,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocalizationMap.getTranslatedValues("backup"),
                  style: R.textStyles
                      .poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                const SizedBox(),
                Text(
                  LocalizationMap.getTranslatedValues("backup_sub"),
                  style: R.textStyles.poppins(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: R.colors.hintColor),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Radio<String>(
                            activeColor: R.colors.secondaryColor,
                            value:
                                LocalizationMap.getTranslatedValues("sd_card"),
                            groupValue: selectedOptions,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOptions = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          LocalizationMap.getTranslatedValues(
                              "sd_card"), // Correct for "mon"
                          style: R.textStyles.poppins(
                              fontSize: selectedOptions ==
                                      LocalizationMap.getTranslatedValues(
                                          "sd_card")
                                  ? 11.sp
                                  : 10.sp,
                              fontWeight: selectedOptions ==
                                      LocalizationMap.getTranslatedValues(
                                          "sd_card")
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: R.colors.black),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Radio<String>(
                            activeColor: R.colors.secondaryColor,
                            value: LocalizationMap.getTranslatedValues(
                                "mobile_device"),
                            groupValue: selectedOptions,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOptions = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          LocalizationMap.getTranslatedValues(
                              "mobile_device"), // Correct for "sat"
                          style: R.textStyles.poppins(
                              fontSize: selectedOptions ==
                                      LocalizationMap.getTranslatedValues(
                                          "mobile_device")
                                  ? 11.sp
                                  : 10.sp,
                              fontWeight: selectedOptions ==
                                      LocalizationMap.getTranslatedValues(
                                          "mobile_device")
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: R.colors.black),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: R.decoration.shadowDecoration(
                      radius: 12,
                      background: R.colors.blackWithOpacity.withOpacity(0.05)),
                  child: ListTile(
                    dense: true,
                    leading: SizedBox(
                      height: 40,
                      width: 30,
                      child: Image.asset(
                        // fit: BoxFit.fitWidth,
                        selectedOptions ==
                                LocalizationMap.getTranslatedValues("sd_card")
                            ? R.images.sdCard
                            : R.images.mobileIcon,
                        color: R.colors.secondaryColor,
                      ),
                    ),
                    title: Text(
                      LocalizationMap.getTranslatedValues(selectedOptions ==
                              LocalizationMap.getTranslatedValues("sd_card")
                          ? "sd_card"
                          : "mobile_device"),
                      style: R.textStyles.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: R.colors.hintColor),
                    ),
                    subtitle: Text(
                      LocalizationMap.getTranslatedValues(
                          "restore_previous_data"),
                      style: R.textStyles.poppins(
                          fontSize: 8.5.sp,
                          fontWeight: FontWeight.w400,
                          color: R.colors.hintColor),
                    ),
                  ),
                ),
                SizedBox(
                    height: 50,
                    width: mediaQuery.size.width,
                    child: GlobalWidget.customButton(
                        title: "restore_data",
                        onPressed: () {
                          Navigator.pop(context);
                        }))
              ],
            )),
      ),
    );
  }
}

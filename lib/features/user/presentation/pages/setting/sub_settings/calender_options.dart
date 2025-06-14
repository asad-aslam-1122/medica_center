import 'package:flutter/material.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/localization/localization.dart';
import '../../../../../../resources/resources.dart';

class CalenderOptions extends StatefulWidget {
  const CalenderOptions({super.key});

  @override
  State<CalenderOptions> createState() => _CalenderOptionsState();
}

class _CalenderOptionsState extends State<CalenderOptions> {
  String? selectedOptions = 'sun';

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: R.colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SizedBox(
            height: mediaQuery.size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocalizationMap.getTranslatedValues("calendar_options"),
                  style: R.textStyles
                      .poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                const SizedBox(),
                Text(
                  LocalizationMap.getTranslatedValues("first_day_of_week"),
                  style: R.textStyles.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                      color: R.colors.black),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Radio<String>(
                            activeColor: R.colors.secondaryColor,
                            visualDensity: VisualDensity.compact,
                            toggleable: true,
                            value: LocalizationMap.getTranslatedValues("sun"),
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
                              "sun"), // Correct for "sun"
                          style: R.textStyles.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: R.colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Radio<String>(
                            activeColor: R.colors.secondaryColor,
                            value: LocalizationMap.getTranslatedValues("mon"),
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
                              "mon"), // Correct for "mon"
                          style: R.textStyles.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: R.colors.black),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 20,
                          child: Radio<String>(
                            activeColor: R.colors.secondaryColor,
                            value: LocalizationMap.getTranslatedValues("sat"),
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
                              "sat"), // Correct for "sat"
                          style: R.textStyles.poppins(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: R.colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(),
                SizedBox(
                    height: 50,
                    width: mediaQuery.size.width,
                    child: GlobalWidget.customButton(
                        title: "done",
                        onPressed: () {
                          Navigator.pop(context);
                        }))
              ],
            )),
      ),
    );
  }
}

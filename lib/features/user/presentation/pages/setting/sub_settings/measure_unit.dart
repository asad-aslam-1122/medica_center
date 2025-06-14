import 'package:flutter/material.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/localization/localization.dart';
import '../../../../../../resources/resources.dart';

class MeasurementUnit extends StatefulWidget {
  const MeasurementUnit({super.key});

  @override
  State<MeasurementUnit> createState() => _MeasurementUnitState();
}

class _MeasurementUnitState extends State<MeasurementUnit> {
  String? selectedOption1 = LocalizationMap.getTranslatedValues('_celsius');
  String? selectedOption2 = LocalizationMap.getTranslatedValues('kg');

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
                  LocalizationMap.getTranslatedValues("measure_units"),
                  style: R.textStyles
                      .poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                const SizedBox(),
                Text(
                  LocalizationMap.getTranslatedValues("temperature"),
                  style: R.textStyles
                      .poppins(fontSize: 13.sp, fontWeight: FontWeight.w600),
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
                                LocalizationMap.getTranslatedValues("_celsius"),
                            groupValue: selectedOption1,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption1 = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          LocalizationMap.getTranslatedValues(
                              "_celsius"), // Correct for "mon"
                          style: R.textStyles.poppins(
                              fontSize: selectedOption1 ==
                                      LocalizationMap.getTranslatedValues(
                                          "_celsius")
                                  ? 11.sp
                                  : 10.sp,
                              fontWeight: selectedOption1 ==
                                      LocalizationMap.getTranslatedValues(
                                          "_celsius")
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
                                "_fahrenheit"),
                            groupValue: selectedOption1,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption1 = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          LocalizationMap.getTranslatedValues(
                              "_fahrenheit"), // Correct for "mon"
                          style: R.textStyles.poppins(
                              fontSize: selectedOption1 ==
                                      LocalizationMap.getTranslatedValues(
                                          "_fahrenheit")
                                  ? 11.sp
                                  : 10.sp,
                              fontWeight: selectedOption1 ==
                                      LocalizationMap.getTranslatedValues(
                                          "_fahrenheit")
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: R.colors.black),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                Text(
                  LocalizationMap.getTranslatedValues("weight"),
                  style: R.textStyles
                      .poppins(fontSize: 13.sp, fontWeight: FontWeight.w600),
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
                            value: LocalizationMap.getTranslatedValues("kg"),
                            groupValue: selectedOption2,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption2 = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          LocalizationMap.getTranslatedValues(
                              "kg"), // Correct for "mon"
                          style: R.textStyles.poppins(
                              fontSize: selectedOption2 ==
                                      LocalizationMap.getTranslatedValues("kg")
                                  ? 11.sp
                                  : 10.sp,
                              fontWeight: selectedOption2 ==
                                      LocalizationMap.getTranslatedValues("kg")
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
                            value: LocalizationMap.getTranslatedValues("lbs"),
                            groupValue: selectedOption2,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedOption2 = newValue;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          LocalizationMap.getTranslatedValues(
                              "lbs"), // Correct for "mon"
                          style: R.textStyles.poppins(
                              fontSize: selectedOption2 ==
                                      LocalizationMap.getTranslatedValues("lbs")
                                  ? 11.sp
                                  : 10.sp,
                              fontWeight: selectedOption2 ==
                                      LocalizationMap.getTranslatedValues("lbs")
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                              color: R.colors.black),
                        ),
                      ],
                    ),
                    const Expanded(child: SizedBox()),
                  ],
                ),
                SizedBox(
                    height: 50,
                    width: mediaQuery.size.width,
                    child: GlobalWidget.customButton(
                        title: "confirm",
                        onPressed: () {
                          Navigator.pop(context);
                        }))
              ],
            )),
      ),
    );
  }
}

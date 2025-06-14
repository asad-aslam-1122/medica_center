import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';
import '../../../../global/widgets/global_widget.dart';

class PeriodLength extends StatefulWidget {
  const PeriodLength({super.key});

  @override
  State<PeriodLength> createState() => _PeriodLengthState();
}

class _PeriodLengthState extends State<PeriodLength> {
  TextEditingController cycleLength = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            height: mediaQuery.size.height * 0.14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text(
                    LocalizationMap.getTranslatedValues("period_length"),
                    style: R.textStyles
                        .poppins(fontWeight: FontWeight.w600, fontSize: 20.sp),
                  ),
                ),
                Text(
                  LocalizationMap.getTranslatedValues(
                      "how_many_days_your_period_last"),
                  style: R.textStyles
                      .poppins(fontWeight: FontWeight.w400, fontSize: 12.sp),
                ),
              ],
            )),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: R.decoration.shadowDecoration(radius: 40),
          child: TextFormField(
            style: R.textStyles.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                isUnderLine: false),
            controller: cycleLength,
            decoration: R.decoration
                .fieldDecoration(hintText: "enter_period_length", radius: 40),
          ),
        ),
        SizedBox(
          height: 45,
          child: GlobalWidget.customButton(
              title: "next", onPressed: () {}, borderRadius: 30),
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.05,
          width: mediaQuery.size.width,
        )
      ],
    );
  }
}

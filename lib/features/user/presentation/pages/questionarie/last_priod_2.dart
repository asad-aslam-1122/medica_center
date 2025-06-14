import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';
import '../../../../global/widgets/global_widget.dart';

class LastPeriod2 extends StatefulWidget {
  const LastPeriod2({super.key});

  @override
  State<LastPeriod2> createState() => _LastPeriod2State();
}

class _LastPeriod2State extends State<LastPeriod2> {
  @override
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Text(
            LocalizationMap.getTranslatedValues("add_your_last_period"),
            style: R.textStyles
                .poppins(fontWeight: FontWeight.w600, fontSize: 20.sp),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          decoration: R.decoration.shadowDecoration(radius: 8),
          child: DatePicker(
            DateTime(DateTime.now().year, 1, 1),
            calendarType: CalendarType.gregorianDate,
            width: 70,
            height: 100,
            monthTextStyle: R.textStyles
                .poppins(fontSize: 12.sp, fontWeight: FontWeight.w600),
            dateTextStyle: R.textStyles.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
            dayTextStyle: R.textStyles
                .poppins(fontSize: 12.sp, fontWeight: FontWeight.w600),
            initialSelectedDate: DateTime(DateTime.now().year, 1, 1),
            deactivatedColor: R.colors.blackWithOpacity,
            selectionColor: R.colors.primaryColorWithOpacity.withOpacity(0.2),
            selectedTextColor: R.colors.secondaryColor,
            onDateChange: (date) {},
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              LocalizationMap.getTranslatedValues("today"),
              style: R.textStyles
                  .poppins(fontWeight: FontWeight.w700, fontSize: 14.sp),
            ),
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

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';
import '../../../../global/utils/global_utils.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: R.colors.white,
      appBar: AppBar(
        leadingWidth: 58,
        elevation: 20,
        shadowColor: R.colors.blackWithOpacity,
        backgroundColor: R.colors.white,
        surfaceTintColor: R.colors.white,
        title: Text(
          LocalizationMap.getTranslatedValues("calendar"),
          style: R.textStyles.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              GlobalUtils.mediaAlertDialog(context);
            },
            child: Container(
              height: 40,
              width: 40,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              child: Image.asset(
                R.images.menuIcon,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          children: [
            Container(
              height: mediaQuery.size.height * 0.56,
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
              padding: const EdgeInsets.all(0),
              width: mediaQuery.size.width,
              decoration: R.decoration
                  .shadowDecoration(radius: 12, background: R.colors.white),
              child: Column(
                children: [
                  CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      customModePickerIcon: const SizedBox(),
                      allowSameValueSelection: false,
                      centerAlignModePicker: true,
                      currentDate: DateTime.now(),
                      selectedDayHighlightColor: R.colors.secondaryColor,
                      calendarType: CalendarDatePicker2Type.multi,
                    ),
                    value: DummyList.pickDatesList,
                    onValueChanged: (List<DateTime?> selectedDates) {
                      DummyList.pickDatesList
                          .clear(); // Clear previous selection
                      DummyList.pickDatesList
                          .addAll(selectedDates.whereType<DateTime>());
                      setState(() {});
                    },
                  ),
                  Expanded(
                      child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisExtent: 35),
                    itemBuilder: (context, index) => rowWithColorText(
                        color:
                            DummyList.calenderStatsList[index].color as Color,
                        title: DummyList.calenderStatsList[index].titleText
                            .toString(),
                        index: index),
                    itemCount: DummyList.calenderStatsList.length,
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            sampleItems(
                imagePath: R.images.medium,
                title: "menstrual_flow",
                subTitle: "medium"),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                sampleItems(
                    imagePath: R.images.weightAndSleep,
                    title: "current_weight",
                    subTitle: "52kg"),
                sampleItems(
                    imagePath: R.images.weightAndSleep,
                    canRotate: true,
                    title: "sleep",
                    subTitle: "8Hr"),
                const SizedBox(),
                const SizedBox()
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            sampleItems(
                imagePath: R.images.happy, title: "mood", subTitle: "happy"),
            const SizedBox(
              height: 10,
            ),
            sampleItems(
                imagePath: R.images.symptoms,
                title: "symptoms",
                subTitle: "cramps_acne_diarrhea"),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget sampleItems({
    required String title,
    required String imagePath,
    required String subTitle,
    bool? canRotate,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocalizationMap.getTranslatedValues(title),
          style: R.textStyles.poppins(
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: R.colors.black,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
              width: 20,
              child: (canRotate ?? false)
                  ? RotatedBox(
                      quarterTurns: 3,
                      child: Image.asset(
                        imagePath.toString(),
                        color: R.colors.primaryColor,
                      ),
                    )
                  : Image.asset(
                      imagePath.toString(),
                      color: R.colors.primaryColor,
                    ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              LocalizationMap.getTranslatedValues(subTitle.toString()),
              style: R.textStyles.poppins(
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget rowWithColorText(
      {required Color color, required String title, required int index}) {
    return Row(
      mainAxisAlignment:
          index % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: color,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Text(
            LocalizationMap.getTranslatedValues(title),
            style: R.textStyles.poppins(
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
              color: R.colors.black,
            ),
          ),
        ),
      ],
    );
  }
}

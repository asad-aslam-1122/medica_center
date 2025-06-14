import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:intl/intl.dart';
import 'package:medical_center/features/user/presentation/pages/pragenent_main/sub_pragnancy_main/pregnancy_tracker2.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/resources.dart';
import '../../../../../global/const/dummy_list.dart';
import '../../../../../global/widgets/custom_drop_down.dart';
import '../../../../../global/widgets/global_widget.dart';

class PregnancyTracker1 extends StatefulWidget {
  const PregnancyTracker1({super.key});

  @override
  State<PregnancyTracker1> createState() => _PregnancyTracker1State();
}

class _PregnancyTracker1State extends State<PregnancyTracker1> {
  TextEditingController birthDateTC = TextEditingController();
  FocusNode birthDateFN = FocusNode();

  String selectedDropDownValue = "last_period";
  bool hasSelectedValue = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: R.colors.white,
      body: SafeArea(
        child: SizedBox(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -mediaQuery.size.height * 0.1,
                right: -mediaQuery.size.width * 0.1,
                child: SizedBox(
                  width: mediaQuery.size.width * 0.5,
                  child: Image.asset(R.images.jelly),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: R.colors.black,
                            size: 25,
                          )),
                      Text(
                        LocalizationMap.getTranslatedValues(
                            "pregnancy_tracker"),
                        textAlign: TextAlign.center,
                        style: R.textStyles.poppins(
                          color: R.colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Image.asset(
                            R.images.menuIcon,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      LocalizationMap.getTranslatedValues("calculate_based_on"),
                      textAlign: TextAlign.start,
                      style: R.textStyles.poppins(
                        color: R.colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomDropDown(
                      dropDownList: DummyList.pregnancyTrackerDropDownList,
                      selectedValue: selectedDropDownValue,
                      hasShowList: hasSelectedValue,
                      tempList2: DummyList.tempList,
                      onTab: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (DummyList.tempList.isNotEmpty || DummyList.tempList != [])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: SizedBox(
                        width: mediaQuery.size.width,
                        child: Visibility(
                          visible: true,
                          child: Wrap(
                            alignment: WrapAlignment.start,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            runAlignment: WrapAlignment.start,
                            children: List.generate(
                                DummyList.tempList.length,
                                (index) => GlobalWidget.itemGeneratedList(
                                    DummyList.tempList[index])),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      LocalizationMap.getTranslatedValues("last_period_date"),
                      textAlign: TextAlign.start,
                      style: R.textStyles.poppins(
                        color: R.colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GlobalWidget.customTextField(
                      hintText: "date_of_birth",
                      context: context,
                      controller: birthDateTC,
                      currentFocusNode: birthDateFN,
                      readOnly: true,
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.calendar_month_outlined,
                            color: R.colors.black,
                            size: 25,
                          )),
                      onTab: () async {
                        var datePicked = await DatePicker.showSimpleDatePicker(
                          context,
                          backgroundColor: R.colors.white,
                          itemTextStyle: R.textStyles.playFair(
                              fontSize: 22.sp, color: R.colors.secondaryColor),
                          textColor: R.colors.black,
                          initialDate: DateTime(1900),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                          pickerMode: DateTimePickerMode.datetime,
                          titleText: "Select Date of Birth",
                          dateFormat: "dd-MMMM-yyyy",
                          locale: DateTimePickerLocale.en_us,
                          looping: true,
                        );

                        birthDateTC.text = DateFormat("dd-MMMM-yyyy")
                            .format(DateTime.parse(datePicked.toString()));

                        setState(() {});
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: SizedBox(
                      height: 50,
                      // width: mediaQuery.size.width * 0.3,
                      child: GlobalWidget.customButton(
                          borderRadius: 30,
                          title: "calculate",
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const PregnancyTracker2(),
                                ));
                          }),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

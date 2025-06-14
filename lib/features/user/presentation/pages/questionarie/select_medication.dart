import 'package:flutter/material.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:medical_center/features/global/widgets/custom_drop_down.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';
import '../../../../global/widgets/global_widget.dart';

class SelectMedication extends StatefulWidget {
  SelectMedication({super.key});

  @override
  State<SelectMedication> createState() => _SelectMedicationState();
}

class _SelectMedicationState extends State<SelectMedication> {
  String selectedDropDownValue = "select_medications";
  bool hasSelectedValue = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DummyList.tempList.clear();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                LocalizationMap.getTranslatedValues(
                    "what_are_your_medical_concerns"),
                textAlign: TextAlign.center,
                style: R.textStyles
                    .poppins(fontWeight: FontWeight.w600, fontSize: 20.sp),
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.2,
              width: mediaQuery.size.width,
              child: Column(
                children: [
                  if (DummyList.tempList.isNotEmpty || DummyList.tempList != [])
                    SizedBox(
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
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    child: GlobalWidget.customButton(
                        title: "next", onPressed: () {}, borderRadius: 30),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: mediaQuery.size.height * 0.18,
          bottom: 0,
          right: 0,
          left: 0,
          child: CustomDropDown(
            dropDownList: DummyList.medicationsList,
            selectedValue: selectedDropDownValue,
            hasShowList: hasSelectedValue,
            tempList2: DummyList.tempList,
            onTab: () {},
          ),
        ),
      ],
    );
  }
}

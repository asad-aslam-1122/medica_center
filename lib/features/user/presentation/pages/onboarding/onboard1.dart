import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';
import '../../../../global/widgets/global_widget.dart';

class Onboard1Page extends StatefulWidget {
  Onboard1Page({super.key});

  @override
  State<Onboard1Page> createState() => _Onboard1PageState();
}

class _Onboard1PageState extends State<Onboard1Page> {
  bool isNextClicked = false;

  @override
  Widget build(BuildContext context) {
    return nextBodySelector(context);
  }

  Widget nextBodySelector(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    if (!isNextClicked) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              LocalizationMap.getTranslatedValues("select_your_language"),
              style: R.textStyles
                  .poppins(fontWeight: FontWeight.w600, fontSize: 20.sp),
            ),
          ),
          Container(
            height: 40,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: R.decoration.shadowDecoration(radius: 40),
            child: LanguagePickerDropdown(
                initialValue: Languages.english,
                itemBuilder: (language) {
                  return Container(
                    height: mediaQuery.size.height * 0.3,
                    width: mediaQuery.size.width,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    decoration: R.decoration.listItemDecoration(
                        radius: 12, backgroundColor: R.colors.white),
                    child: Center(
                      child: Text(
                        language.name,
                        style: R.textStyles.poppins(
                            fontSize: 14.sp,
                            color: R.colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  );
                },
                onValuePicked: (Language language) {
                  if (!DummyList.tempList.contains(language.name)) {
                    DummyList.tempList.add(language.name);
                  }
                  setState(() {});
                }),
          ),
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
          SizedBox(
            height: 45,
            child: GlobalWidget.customButton(
                title: "next",
                onPressed: () {
                  isNextClicked = true;
                  setState(() {});
                },
                borderRadius: 30),
          ),
          SizedBox(
            height: mediaQuery.size.height * 0.05,
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Text(
                LocalizationMap.getTranslatedValues("welcome"),
                style: R.textStyles
                    .montserrat(fontWeight: FontWeight.w400, fontSize: 20.sp),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              LocalizationMap.getTranslatedValues("onboard_disc1"),
              textAlign: TextAlign.center,
              style: R.textStyles
                  .poppins(fontWeight: FontWeight.w600, fontSize: 24.sp),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "${LocalizationMap.getTranslatedValues("get_started")}\t ",
                    style: R.textStyles.montserrat(
                        fontWeight: FontWeight.w400, fontSize: 20.sp),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: R.colors.black,
                    size: 20,
                  )
                ],
              ),
            ),
          ),
        ],
      );
    }
  }
}

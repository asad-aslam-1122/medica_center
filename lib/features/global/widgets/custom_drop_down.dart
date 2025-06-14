import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../resources/resources.dart';

class CustomDropDown extends StatefulWidget {
  List<String> dropDownList;
  bool hasShowList = false;
  List<String> tempList2;
  String selectedValue;
  bool? isStartingPage;
  VoidCallback onTab;

  CustomDropDown(
      {super.key,
      required this.tempList2,
      required this.hasShowList,
      required this.dropDownList,
      required this.selectedValue,
      this.isStartingPage,
      required this.onTab});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.hasShowList = !widget.hasShowList;
            });
          },
          child: Container(
              height: 40,
              width: 100.w,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: R.decoration.shadowDecoration(radius: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    LocalizationMap.getTranslatedValues(widget.selectedValue),
                    style: R.textStyles.poppins(fontSize: 12.sp),
                  ),
                  const Icon(Icons.keyboard_arrow_down)
                ],
              )),
        ),
        if (widget.hasShowList)
          Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                  ),
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: R.decoration
                      .shadowDecoration(radius: 12, background: R.colors.white),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    primary: true,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: widget.dropDownList
                        .map(
                          (items) => Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            child: InkWell(
                              onTap: () {
                                widget.selectedValue = items;

                                if (!widget.tempList2
                                    .contains(widget.selectedValue)) {
                                  widget.tempList2.add(widget.selectedValue);
                                }

                                if ((widget.isStartingPage ?? false) &&
                                    widget.tempList2.length > 2) {
                                  widget.tempList2.removeRange(
                                      2, widget.tempList2.length - 1);
                                }

                                widget.hasShowList = !widget.hasShowList;
                                Get.forceAppUpdate();
                              },
                              child: Text(
                                  LocalizationMap.getTranslatedValues(items),
                                  style: R.textStyles.poppins(fontSize: 12.sp)),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              )
            ],
          )
      ],
    );
  }
}

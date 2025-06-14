import 'package:flutter/cupertino.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';
import '../../../../global/widgets/global_widget.dart';

class LastPeriod1 extends StatefulWidget {
  const LastPeriod1({super.key});

  @override
  State<LastPeriod1> createState() => _LastPeriod1State();
}

class _LastPeriod1State extends State<LastPeriod1> {
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
        SizedBox(
          height: mediaQuery.size.height * 0.2,
          width: mediaQuery.size.width,
          child: CupertinoPicker(
            itemExtent: 45.0,
            onSelectedItemChanged: (int index) {
              print('Selected item $index');
            },
            magnification: 1.2,
            diameterRatio: 2.8,
            useMagnifier: true,
            squeeze: 1,
            selectionOverlay: Container(
              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              decoration: R.decoration.linearGradient(),
            ),
            children: List.generate(
              DummyList.monthsList.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                child: Center(
                  child: Text(
                    DummyList.monthsList[index],
                    style: R.textStyles.poppins(
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp,
                        color: R.colors.secondaryColor),
                  ),
                ),
              ),
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

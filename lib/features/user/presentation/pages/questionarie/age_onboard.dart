import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';
import '../../../../global/widgets/global_widget.dart';

class AgeOnboard extends StatefulWidget {
  const AgeOnboard({super.key});

  @override
  State<AgeOnboard> createState() => _AgeOnboardState();
}

class _AgeOnboardState extends State<AgeOnboard> {
  TextEditingController ageTC = TextEditingController();

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
            LocalizationMap.getTranslatedValues("whats_your_age"),
            style: R.textStyles
                .poppins(fontWeight: FontWeight.w600, fontSize: 20.sp),
          ),
        ),
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: R.decoration.shadowDecoration(radius: 40),
          child: TextFormField(
            style: R.textStyles.poppins(
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
                isUnderLine: false),
            controller: ageTC,
            decoration:
                R.decoration.fieldDecoration(hintText: "enter_age", radius: 40),
          ),
        ),
        SizedBox(
          height: 45,
          child: GlobalWidget.customButton(
              title: "next", onPressed: () {}, borderRadius: 30),
        ),
        SizedBox(
          height: mediaQuery.size.height * 0.05,
        ),
      ],
    );
  }
}

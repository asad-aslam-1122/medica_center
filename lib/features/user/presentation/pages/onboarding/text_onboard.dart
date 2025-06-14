import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';

class TextOnBoard extends StatelessWidget {
  String title;

  TextOnBoard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocalizationMap.getTranslatedValues(title),
        textAlign: TextAlign.center,
        style: R.textStyles.poppins(
            fontWeight: FontWeight.w600,
            color: R.colors.black,
            fontSize: 22.sp),
      ),
    );
  }
}

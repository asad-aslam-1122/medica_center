import 'package:flutter/material.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';
import '../../../resources/resources.dart';

class GlobalUtils {
  static Future<void> mediaAlertDialog(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          backgroundColor: R.colors.white,
          child: SizedBox(
            height: mediaQuery.size.height * 0.25,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: DummyList.alertMediaList.map(
                (mediaItem) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    color: R.colors.white,
                    margin:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: R.decoration.imageDecoration2(
                              imagePath: mediaItem.imagePath.toString(),
                              backgroundColor: R.colors.white,
                              radius: 18),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          LocalizationMap.getTranslatedValues(
                              mediaItem.title.toString()),
                          style: R.textStyles.poppins(
                              fontSize: 12.sp, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        );
      },
    );
  }
}

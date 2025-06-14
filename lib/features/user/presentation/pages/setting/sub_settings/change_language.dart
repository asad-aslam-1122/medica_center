import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/localization/localization.dart';
import '../../../../../../resources/resources.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: R.colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SizedBox(
            height: mediaQuery.size.height * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocalizationMap.getTranslatedValues("change_language"),
                  style: R.textStyles
                      .poppins(fontSize: 16.sp, fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      LocalizationMap.getTranslatedValues("current_language"),
                      style: R.textStyles.poppins(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: R.colors.secondaryColor),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Text(
                        selectedLanguage,
                        softWrap: true,
                        overflow: TextOverflow.clip,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: R.textStyles.poppins(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w600,
                            color: R.colors.hintColor),
                      ),
                    ),
                  ],
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
                              maxLines: 1,
                              language.name,
                              style: R.textStyles.poppins(
                                  fontSize: 12.sp,
                                  color: R.colors.black,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        );
                      },
                      onValuePicked: (Language language) {
                        selectedLanguage = language.name;
                        setState(() {});
                      }),
                ),
                SizedBox(
                    height: 50,
                    width: mediaQuery.size.width,
                    child: GlobalWidget.customButton(
                        title: "confirm",
                        onPressed: () {
                          Navigator.pop(context);
                        }))
              ],
            )),
      ),
    );
  }
}

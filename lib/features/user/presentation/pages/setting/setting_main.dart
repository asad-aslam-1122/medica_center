import 'package:flutter/material.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:medical_center/features/user/presentation/pages/setting/sub_settings/backup_restore.dart';
import 'package:medical_center/features/user/presentation/pages/setting/sub_settings/calender_options.dart';
import 'package:medical_center/features/user/presentation/pages/setting/sub_settings/change_language.dart';
import 'package:medical_center/features/user/presentation/pages/setting/sub_settings/measure_unit.dart';
import 'package:medical_center/features/user/presentation/pages/setting/sub_settings/security.dart';
import 'package:sizer/sizer.dart';
import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';

class MainSetting extends StatefulWidget {
  const MainSetting({super.key});

  @override
  State<MainSetting> createState() => _MainSettingState();
}

class _MainSettingState extends State<MainSetting> {
  int selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.colors.white,
        appBar: AppBar(
          elevation: 20,
          shadowColor: R.colors.blackWithOpacity,
          backgroundColor: R.colors.white,
          surfaceTintColor: R.colors.white,
          centerTitle: true,
          title: Text(
            LocalizationMap.getTranslatedValues("settings"),
            style: R.textStyles.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
                padding: const EdgeInsets.all(0),
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: R.decoration.shadowDecoration(
                    radius: 8,
                    background: selectedOption == index
                        ? R.colors.primaryColor
                        : R.colors.white),
                child: ListTile(
                  onTap: () {
                    setState(() {
                      selectedOption = index;
                    });
                    showAlertDialogManager(index: index);
                  },
                  splashColor: R.colors.primaryColorWithOpacity,
                  leading: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset(
                      DummyList.settingOptionsList[index].imagePath.toString(),
                      color: selectedOption == index
                          ? R.colors.white
                          : R.colors.primaryColor,
                    ),
                  ),
                  title: Text(
                    LocalizationMap.getTranslatedValues(DummyList
                        .settingOptionsList[index].titleText
                        .toString()),
                    style: R.textStyles.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: selectedOption == index
                          ? R.colors.white
                          : R.colors.black,
                    ),
                  ),
                ));
          },
          itemCount: DummyList.settingOptionsList.length,
        ));
  }

  void alertBodyManager(Widget body) {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        showDialog(
          context: context,
          builder: (context) {
            return body;
          },
        );
      },
    );
  }

  void showAlertDialogManager({required int index}) {
    switch (index) {
      case 0:
        alertBodyManager(const CalenderOptions());
        break;
      case 1:
        alertBodyManager(const Security());
        break;
      case 2:
        alertBodyManager(const BackupRestore());
        break;
      case 3:
        alertBodyManager(const MeasurementUnit());
        break;
      default:
        alertBodyManager(const ChangeLanguage());
    }
  }
}

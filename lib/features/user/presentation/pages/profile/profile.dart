import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:intl/intl.dart';
import 'package:medical_center/features/user/presentation/pages/notifications/notifications.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';
import '../../../../global/widgets/global_widget.dart';
import 'change_password_alert.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController emailTC = TextEditingController();

  TextEditingController birthDateTC = TextEditingController();

  FocusNode emailFN = FocusNode();
  FocusNode birthDateFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: R.colors.white,
      body: SizedBox(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Column(
          children: [
            Container(
              height: mediaQuery.size.height * 0.17,
              width: mediaQuery.size.width,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              decoration: BoxDecoration(
                  color: R.colors.primaryColor,
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.elliptical(300, 50),
                  )),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Notifications(),
                            ));
                      },
                      icon: Icon(
                        Icons.notifications_outlined,
                        size: 30,
                        color: R.colors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25,
                        color: R.colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -70,
                    left: 0,
                    right: 0,
                    child: Container(
                        height: 100,
                        width: 100,
                        decoration: R.decoration.imageDecoration(
                            backgroundColor: R.colors.lightSky,
                            imagePath: R.images.userImg),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: -70,
                              bottom: 0,
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: R.decoration.imageDecoration(
                                    backgroundColor: R.colors.white,
                                    imagePath: R.images.editIcon),
                              ),
                            ),
                          ],
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: mediaQuery.size.height * 0.15,
            ),
            GlobalWidget.customTextField(
                hintText: "email",
                context: context,
                controller: emailTC,
                currentFocusNode: emailFN,
                nextFocusNode: birthDateFN),
            const SizedBox(
              height: 20,
            ),
            GlobalWidget.customTextField(
                hintText: "birthdate",
                context: context,
                controller: birthDateTC,
                currentFocusNode: birthDateFN,
                readOnly: true,
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
            const Expanded(child: SizedBox()),
            SizedBox(
              height: 50,
              width: mediaQuery.size.width * 0.85,
              child: GlobalWidget.customButton(
                  title: "change_password",
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return const ChangePasswordAlert();
                      },
                    );
                  },
                  borderRadius: 30),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              width: mediaQuery.size.width * 0.85,
              child: GlobalWidget.customButton(
                  title: "edit_info",
                  onPressed: () {
                    BotToast.showText(
                        textStyle: R.textStyles.poppins(
                            fontWeight: FontWeight.w500,
                            color: R.colors.black,
                            fontSize: 10.sp),
                        text: LocalizationMap.getTranslatedValues(
                            "your_edit_information_have_been_successfully_saved"));
                  },
                  borderRadius: 30),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
    );
  }
}

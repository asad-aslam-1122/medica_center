import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:flutter_holo_date_picker/i18n/date_picker_i18n.dart';
import 'package:intl/intl.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';
import '../../provider/login_and_signup/login_body.dart';

class SignUpDashboard extends StatefulWidget {
  const SignUpDashboard({super.key});

  @override
  State<SignUpDashboard> createState() => _SignUpDashboardState();
}

class _SignUpDashboardState extends State<SignUpDashboard> {
  TextEditingController emailTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();
  TextEditingController confirmPasswordTC = TextEditingController();
  TextEditingController birthDateTC = TextEditingController();

  FocusNode emailFN = FocusNode();
  FocusNode birthDateFN = FocusNode();
  FocusNode passwordFN = FocusNode();
  FocusNode confirmPasswordFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    LoginIndexProvider loginIndexProvider = Provider.of(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 1.5.h,
          ),
          GlobalWidget.customTextField(
              hintText: "email",
              context: context,
              controller: emailTC,
              currentFocusNode: emailFN,
              nextFocusNode: passwordFN),
          SizedBox(
            height: 2.5.h,
          ),
          GlobalWidget.customTextField(
              hintText: "date_of_birth",
              context: context,
              controller: birthDateTC,
              currentFocusNode: birthDateFN,
              nextFocusNode: passwordFN,
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
          SizedBox(
            height: 2.5.h,
          ),
          GlobalWidget.customTextField(
              hintText: "password",
              context: context,
              controller: passwordTC,
              currentFocusNode: passwordFN),
          SizedBox(
            height: 2.5.h,
          ),
          GlobalWidget.customTextField(
              hintText: "confirm_password",
              context: context,
              controller: confirmPasswordTC,
              currentFocusNode: confirmPasswordFN,
              inputAction: TextInputAction.done),
          SizedBox(
            height: 2.5.h,
          ),
          GlobalWidget.customButton(
              title: "sign_up",
              onPressed: () {
                loginIndexProvider.setIndexValue(1);
              },
              borderRadius: 40),
          SizedBox(
            height: MediaQuery.of(context).viewInsets.bottom > 0 ? 20.h : 0.h,
          )
        ],
      ),
    );
  }
}

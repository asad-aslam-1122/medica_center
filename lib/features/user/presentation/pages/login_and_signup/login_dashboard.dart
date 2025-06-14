import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medical_center/features/app/dashboard_page.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';
import '../../provider/login_and_signup/login_body.dart';

class LoginDashboard extends StatefulWidget {
  const LoginDashboard({super.key});

  @override
  State<LoginDashboard> createState() => _LoginDashboardState();
}

class _LoginDashboardState extends State<LoginDashboard> {
  TextEditingController emailTC = TextEditingController();
  TextEditingController passwordTC = TextEditingController();

  FocusNode emailFN = FocusNode();
  FocusNode passwordFN = FocusNode();

  @override
  Widget build(BuildContext context) {
    LoginIndexProvider loginIndexProvider = Provider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GlobalWidget.customTextField(
            hintText: "email",
            context: context,
            controller: emailTC,
            currentFocusNode: emailFN,
            nextFocusNode: passwordFN),
        GlobalWidget.customTextField(
            hintText: "password",
            context: context,
            controller: passwordTC,
            currentFocusNode: passwordFN,
            inputAction: TextInputAction.done),
        SizedBox(
          height: 13.h,
          child: Column(
            children: [
              GlobalWidget.customButton(
                  title: "login",
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DashboardPage(),
                        ));
                  },
                  borderRadius: 40),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Text(
                      LocalizationMap.getTranslatedValues("forgot_password"),
                      style: R.textStyles.playFair(
                          fontWeight: FontWeight.w600, fontSize: 14.sp),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        RichText(
            text: TextSpan(
                style: R.textStyles
                    .playFair(fontSize: 12.sp, fontWeight: FontWeight.w900),
                children: [
              TextSpan(
                text: LocalizationMap.getTranslatedValues(
                    "don’t_have_an_account"),
              ),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      loginIndexProvider.setIndexValue(2);
                    },
                  text: LocalizationMap.getTranslatedValues("sign_up"),
                  style: R.textStyles.playFair(
                      color: R.colors.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900))
            ])),
        SizedBox(
          height: 6.h,
        )
      ],
    );
  }
}

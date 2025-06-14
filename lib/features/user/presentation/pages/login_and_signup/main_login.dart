import 'package:flutter/material.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:medical_center/features/user/presentation/pages/login_and_signup/login_dashboard.dart';
import 'package:medical_center/features/user/presentation/pages/login_and_signup/login_modes.dart';
import 'package:medical_center/features/user/presentation/pages/login_and_signup/sign_up.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';
import '../../provider/login_and_signup/login_body.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({super.key});

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
  List<Widget> loginBodies = [
    LoginModes(),
    LoginDashboard(),
    SignUpDashboard()
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: R.colors.white,
      body: SizedBox(
        height: mediaQuery.size.height,
        width: mediaQuery.size.width,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.expand,
          children: [
            Positioned(
              top: -mediaQuery.size.height * 0.11,
              right: -mediaQuery.size.width * 0.12,
              child: SizedBox(
                width: mediaQuery.size.width * 0.5,
                child: Image.asset(R.images.jelly),
              ),
            ),
            Positioned(
              bottom: -mediaQuery.size.height * 0.11,
              left: -mediaQuery.size.width * 0.2,
              child: RotatedBox(
                quarterTurns: 2,
                child: SizedBox(
                  width: mediaQuery.size.width * 0.5,
                  child: Image.asset(R.images.jelly),
                ),
              ),
            ),
            Container(
              height: mediaQuery.size.height,
              margin: EdgeInsets.only(
                  top: mediaQuery.size.height * 0.15,
                  bottom: mediaQuery.size.height * 0.15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: mediaQuery.size.width * 0.4,
                    child: Image.asset(R.images.appIcon),
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.04,
                  ),
                  Expanded(
                    child: Consumer<LoginIndexProvider>(
                      builder: (context, loginBodyProvider, child) {
                        return loginBodies[loginBodyProvider.currentIndex];
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget rowButton({required String imagePath, required String title}) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: R.decoration.shadowDecoration(radius: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 30,
            width: 30,
            child: Image.asset(imagePath),
          ),
          Text(
            LocalizationMap.getTranslatedValues(title),
            style: R.textStyles
                .poppins(fontSize: 15.sp, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget simpleButton({required String title}) {
    return Container(
      height: 45,
      width: 100.w,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: GlobalWidget.customButton(
          title: title, onPressed: () {}, borderRadius: 40),
    );
  }
}

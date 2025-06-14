import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:medical_center/features/user/presentation/provider/login_and_signup/login_body.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';

class LoginModes extends StatefulWidget {
  const LoginModes({super.key});

  @override
  State<LoginModes> createState() => _LoginModesState();
}

class _LoginModesState extends State<LoginModes> {
  @override
  Widget build(BuildContext context) {
    LoginIndexProvider loginIndexProvider = Provider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        rowButton(imagePath: R.images.google, title: "continue_with_google"),
        rowButton(
            imagePath: R.images.facebook, title: "continue_with_facebook"),
        Text(
          LocalizationMap.getTranslatedValues("or"),
          style: R.textStyles
              .playFair(fontSize: 15.sp, fontWeight: FontWeight.w600),
        ),
        simpleButton(title: "continue_with_email"),
        simpleButton(title: "continue_with_phone_num"),
        RichText(
            text: TextSpan(
                style: R.textStyles
                    .playFair(fontSize: 12.sp, fontWeight: FontWeight.w900),
                children: [
              TextSpan(
                text: LocalizationMap.getTranslatedValues(
                    "already_have_an_account"),
              ),
              TextSpan(
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      loginIndexProvider.setIndexValue(1);
                    },
                  text: LocalizationMap.getTranslatedValues("login"),
                  style: R.textStyles.playFair(
                      color: R.colors.primaryColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w900))
            ]))
      ],
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

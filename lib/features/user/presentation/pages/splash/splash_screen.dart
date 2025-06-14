import 'package:flutter/material.dart';

import '../../../../../resources/resources.dart';
import '../main_background_sample/main_background_sample.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MainBackgroundSample(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: R.colors.white,
      body: Center(
        child: Image.asset(
          R.images.appIcon,
          width: mediaQuery.size.width * 0.8,
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:medical_center/resources/resources.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'features/user/presentation/pages/splash/splash_screen.dart';
import 'features/user/presentation/provider/login_and_signup/login_body.dart';
import 'features/user/presentation/provider/onboarding/onboarding_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: R.colors.transparent));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final FlutterLocalization _localization = FlutterLocalization.instance;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageViewIndexProvider()),
        ChangeNotifierProvider(create: (_) => LoginIndexProvider()),
      ],
      child: Sizer(builder: (context, orientation, deviceType) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            builder: (context, builder) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1)),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: GetMaterialApp(
                    builder: BotToastInit(),
                    navigatorObservers: [BotToastNavigatorObserver()],
                    theme: ThemeData(
                        useMaterial3: true,
                        primaryColor: R.colors.primaryColor,
                        textSelectionTheme: TextSelectionThemeData(
                            cursorColor: R.colors.primaryColor,
                            selectionColor: R.colors.primaryColor,
                            selectionHandleColor: R.colors.primaryColor)),
                    title: 'Medica Center',
                    fallbackLocale: const Locale('en', 'US'),
                    supportedLocales: const [
                      Locale('en', 'US'),
                    ],
                    localizationsDelegates: [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    localeResolutionCallback: (Locale? deviceLocale,
                        Iterable<Locale> supportedLocales) {
                      for (var locale in supportedLocales) {
                        if (locale.languageCode == deviceLocale!.languageCode &&
                            locale.countryCode == deviceLocale.countryCode) {
                          return deviceLocale;
                        }
                      }
                      return supportedLocales.first;
                    },
                    debugShowCheckedModeBanner: false,
                    home: const SplashScreen(),
                  ),
                ),
              );
            });
      }),
    );
  }
}

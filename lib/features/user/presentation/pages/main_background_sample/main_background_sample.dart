import 'package:flutter/material.dart';
import 'package:medical_center/features/user/presentation/pages/login_and_signup/main_login.dart';
import 'package:medical_center/features/user/presentation/pages/onboarding/text_onboard.dart';
import 'package:medical_center/features/user/presentation/pages/questionarie/age_onboard.dart';
import 'package:medical_center/features/user/presentation/pages/questionarie/cycle_symptoms.dart';
import 'package:medical_center/features/user/presentation/pages/questionarie/name_onboard.dart';
import 'package:medical_center/features/user/presentation/pages/questionarie/select_medication.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../resources/resources.dart';
import '../../provider/onboarding/onboarding_provider.dart';
import '../onboarding/onboard1.dart';
import '../questionarie/cycle_length.dart';
import '../questionarie/last_period1.dart';
import '../questionarie/last_priod_2.dart';
import '../questionarie/period_length.dart';
import '../questionarie/upload_photo.dart';

class MainBackgroundSample extends StatefulWidget {
  MainBackgroundSample({super.key});

  @override
  State<MainBackgroundSample> createState() => _MainBackgroundSampleState();
}

class _MainBackgroundSampleState extends State<MainBackgroundSample> {
  List<Widget> bodyPages = [
    Onboard1Page(),
    TextOnBoard(title: "onboard_disc2"),
    TextOnBoard(title: "onboard_disc3"),
    TextOnBoard(title: "onboard_disc4"),
    const NameOnboard(),
    const AgeOnboard(),
    const UploadPhoto(),
    const LastPeriod1(),
    const LastPeriod2(),
    const CycleLength(),
    const PeriodLength(),
    CycleSymptoms(),
    SelectMedication(),
  ];

  PageController pageController = PageController();

  bool isNextClicked = false;

  void goToNextPage(int currentIndex) {
    if (currentIndex < bodyPages.length - 1) {
      currentIndex++;
      pageController.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const MainLogin(),
          ));
    }
  }

  void goToPreviousPage(int currentIndex) {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

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
                  Expanded(child: Consumer<PageViewIndexProvider>(
                    builder: (context, indexValue, child) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: pageController,
                              onPageChanged: (newIndex) {
                                indexValue.setIndexValue(newIndex);
                              },
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: bodyPages[index],
                                );
                              },
                              itemCount: bodyPages.length,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              indexValue.currentIndex != 0
                                  ? IconButton(
                                      onPressed: () {
                                        goToPreviousPage(
                                            indexValue.currentIndex);
                                      },
                                      style: ButtonStyle(
                                          shadowColor: WidgetStatePropertyAll(
                                              R.colors.black.withOpacity(0.8)),
                                          elevation:
                                              const WidgetStatePropertyAll(3),
                                          padding: const WidgetStatePropertyAll(
                                              EdgeInsets.all(0)),
                                          backgroundColor:
                                              WidgetStatePropertyAll(
                                                  R.colors.white),
                                          shape: const WidgetStatePropertyAll(
                                              CircleBorder(
                                                  side: BorderSide.none))),
                                      icon: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        color:
                                            R.colors.hintColor.withOpacity(0.7),
                                        size: 16,
                                      ),
                                    )
                                  : const SizedBox(),
                              SmoothPageIndicator(
                                controller: pageController,
                                count: bodyPages.length,
                                axisDirection: Axis.horizontal,
                                effect: ScrollingDotsEffect(
                                    dotHeight: 8,
                                    dotWidth: 8,
                                    activeDotColor: R.colors.secondaryColor,
                                    dotColor:
                                        R.colors.hintColor.withOpacity(0.4)),
                              ),
                              IconButton(
                                onPressed: () {
                                  goToNextPage(indexValue.currentIndex);
                                },
                                style: ButtonStyle(
                                    padding: const WidgetStatePropertyAll(
                                        EdgeInsets.all(0)),
                                    backgroundColor: WidgetStatePropertyAll(
                                        R.colors.secondaryColor),
                                    shape: const WidgetStatePropertyAll(
                                        CircleBorder())),
                                icon: Icon(
                                  Icons.arrow_forward_ios,
                                  color: R.colors.white,
                                  size: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

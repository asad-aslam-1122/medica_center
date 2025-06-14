import 'package:flutter/material.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:medical_center/features/user/presentation/pages/pragenent_main/sub_pragnancy_main/journal_page1.dart';
import 'package:medical_center/features/user/presentation/pages/pragenent_main/sub_pragnancy_main/mood_tracker1.dart';
import 'package:medical_center/features/user/presentation/pages/pragenent_main/sub_pragnancy_main/pregnancy_tracker1.dart';
import 'package:medical_center/features/user/presentation/pages/pragenent_main/sub_pragnancy_main/weight_tracker1.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';

class PregnancyDashboard extends StatefulWidget {
  const PregnancyDashboard({super.key});

  @override
  State<PregnancyDashboard> createState() => _PregnancyDashboardState();
}

class _PregnancyDashboardState extends State<PregnancyDashboard> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: R.colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -mediaQuery.size.height * 0.07,
            right: -mediaQuery.size.width * 0.07,
            child: SizedBox(
              width: mediaQuery.size.width * 0.5,
              child: Image.asset(R.images.jelly),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: mediaQuery.size.height * 0.08,
              child: SizedBox(
                height: mediaQuery.size.height * 0.22,
                width: mediaQuery.size.width,
                child: Image.asset(
                  R.images.motherIcon,
                ),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Column(
              children: [
                SizedBox(
                  height: mediaQuery.size.height * 0.28,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 65,
                        width: 65,
                        margin: const EdgeInsets.all(8),
                        decoration: R.decoration.shadowDecoration(
                          radius: 8,
                          background: R.colors.secondaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "1g",
                              textAlign: TextAlign.center,
                              style: R.textStyles.poppins(
                                color: R.colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "weight",
                              textAlign: TextAlign.center,
                              style: R.textStyles.poppins(
                                color: R.colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 65,
                        width: 65,
                        margin: const EdgeInsets.all(8),
                        decoration: R.decoration.shadowDecoration(
                          radius: 8,
                          background: R.colors.secondaryColor,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "1.6cm",
                              textAlign: TextAlign.center,
                              style: R.textStyles.poppins(
                                color: R.colors.white,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "length",
                              textAlign: TextAlign.center,
                              style: R.textStyles.poppins(
                                color: R.colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 80,
                  width: mediaQuery.size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Container(
                        width: index == 2 ? 60 : 50,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 10),
                        decoration: R.decoration.shadowCircleDecoration(
                            background: index == 2
                                ? R.colors.secondaryColor
                                : R.colors.transparent),
                        child: Center(
                          child: Text(
                            "${index + 1}",
                            textAlign: TextAlign.center,
                            style: R.textStyles.poppins(
                              color: index == 2
                                  ? R.colors.white
                                  : R.colors.secondaryColor,
                              fontSize: index == 2 ? 22.sp : 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    },
                    scrollDirection: Axis.horizontal,
                    itemCount: 30,
                    shrinkWrap: true,
                  ),
                ),
                Text(
                  LocalizationMap.getTranslatedValues("current_week"),
                  textAlign: TextAlign.center,
                  style: R.textStyles.poppins(
                    color: R.colors.secondaryColor,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: ListView.builder(
                  padding: const EdgeInsets.all(0),
                  itemBuilder: (context, index) {
                    return Container(
                      height: mediaQuery.size.height * 0.15,
                      width: mediaQuery.size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color:
                                    R.colors.blackWithOpacity.withOpacity(0.4),
                                blurRadius: 2,
                                spreadRadius: 2,
                                blurStyle: BlurStyle.outer),
                            BoxShadow(
                                color: R.colors.secondaryColor,
                                blurRadius: 1,
                                spreadRadius: 1,
                                blurStyle: BlurStyle.outer)
                          ],
                          borderRadius: BorderRadius.circular(18),
                          color: index % 2 == 0
                              ? R.colors.primaryColor
                              : R.colors.secondaryColor,
                          image: DecorationImage(
                              image: AssetImage(R.images.cardDesign),
                              fit: BoxFit.fill)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            LocalizationMap.getTranslatedValues(index == 0
                                ? "kick_counter"
                                : index == 1
                                    ? "weight_tracker"
                                    : index == 2
                                        ? "mood_tracker"
                                        : "pregnancy_tracker"),
                            textAlign: TextAlign.center,
                            style: R.textStyles.poppins(
                              color: R.colors.white,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(),
                          SizedBox(
                            height: 30,
                            child: GlobalWidget.customButton(
                                title: index == 0 ? "count_now" : "track_now",
                                onPressed: () {
                                  if (index == 0) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const JournalPage(),
                                        ));
                                  } else if (index == 1) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const WeightTracker1(),
                                        ));
                                  } else if (index == 2) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const MoodTracker1(),
                                        ));
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const PregnancyTracker1(),
                                        ));
                                  }
                                },
                                textSize: 10.sp,
                                backGroundColor: R.colors.white,
                                textColor: index % 2 == 0
                                    ? R.colors.primaryColor
                                    : R.colors.secondaryColor,
                                borderRadius: 30),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: 4,
                ))
              ],
            ),
          )
        ],
      ),
    );
  }
}

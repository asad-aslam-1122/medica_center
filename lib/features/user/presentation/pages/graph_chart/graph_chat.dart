import 'package:flutter/material.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';

class GraphChat extends StatefulWidget {
  const GraphChat({super.key});

  @override
  State<GraphChat> createState() => _GraphChatState();
}

class _GraphChatState extends State<GraphChat> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: R.colors.white,
      appBar: AppBar(
        elevation: 20,
        shadowColor: R.colors.blackWithOpacity,
        backgroundColor: R.colors.white,
        surfaceTintColor: R.colors.white,
        centerTitle: true,
        title: Text(
          LocalizationMap.getTranslatedValues("charts"),
          style: R.textStyles.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.all(8),
              decoration: R.decoration
                  .shadowDecoration(radius: 8, background: R.colors.white),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocalizationMap.getTranslatedValues(
                              "general_activity"),
                          style: R.textStyles.poppins(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: R.colors.blackWithOpacity.withOpacity(0.4),
                              size: 15,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.calendar_month_outlined,
                              color: R.colors.black,
                              size: 15,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              "21 - 28 Apr, 2023",
                              style: R.textStyles.poppins(
                                color:
                                    R.colors.blackWithOpacity.withOpacity(0.6),
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQuery.size.height * 0.25,
                    width: mediaQuery.size.width,
                    child: Image.asset(
                      R.images.activityGraph,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                LocalizationMap.getTranslatedValues("charts"),
                style: R.textStyles.poppins(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.symmetric(vertical: 8),
                decoration: R.decoration.shadowDecoration(radius: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8),
                      child: Text(
                        LocalizationMap.getTranslatedValues(
                            "menstruation_stats"),
                        style: R.textStyles.poppins(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "11 June - 14 June",
                      style: R.textStyles.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      LocalizationMap.getTranslatedValues("this_week_cycle"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    SizedBox(
                      height: mediaQuery.size.height * 0.25,
                      width: mediaQuery.size.width,
                      child: Image.asset(
                        R.images.activityGraph,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Wrap(
                        children: DummyList.graphMenstruationList.map(
                          (menstruationStates) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircleAvatar(
                                    radius: 8,
                                    backgroundColor: menstruationStates.color,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      LocalizationMap.getTranslatedValues(
                                          menstruationStates.titleText
                                              .toString()),
                                      style: R.textStyles.poppins(
                                        fontSize: 8.5.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: R.decoration.shadowDecoration(
                radius: 8,
              ),
              child: blockDataWidget(
                  title: "menstrual_cycles",
                  subTitle1: "avg_Amount_of_cycles",
                  givePercentAge: false,
                  subTitle2: "minimum_amount_of_cycles"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: R.decoration.shadowDecoration(
                radius: 8,
              ),
              child: blockDataWidget(
                  title: "weight_changes",
                  subTitle1: "gained",
                  givePercentAge: true,
                  subTitle2: "released"),
            )
          ],
        ),
      ),
    );
  }

  Widget blockDataWidget({
    required String title,
    required String subTitle1,
    required String subTitle2,
    required bool givePercentAge,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              R.images.heart,
              color: R.colors.primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              LocalizationMap.getTranslatedValues(title),
              style: R.textStyles.poppins(
                fontSize: 16.sp,
                color: R.colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                Image.asset(
                  R.images.upDownArrow,
                  color: R.colors.primaryColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    LocalizationMap.getTranslatedValues(subTitle1),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: R.textStyles.poppins(
                      fontSize: 12.5.sp,
                      color: R.colors.boldGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )),
        Row(
          children: [
            Expanded(
                child: CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 12.0,
              percent: 0.1,
              reverse: true,
              center: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "4",
                    style: R.textStyles.poppins(
                      fontSize: 14.sp,
                      color: R.colors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    LocalizationMap.getTranslatedValues("times"),
                    style: R.textStyles.poppins(
                      fontSize: 8.sp,
                      color: R.colors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    LocalizationMap.getTranslatedValues("avg_per_week"),
                    style: R.textStyles.poppins(
                      fontSize: 5.sp,
                      color: R.colors.boldGrey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              backgroundColor: R.colors.hintColor.withOpacity(0.15),
              progressColor: R.colors.primaryColor,
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                    child: Text(
                      LocalizationMap.getTranslatedValues("time"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                    child: Text(
                      LocalizationMap.getTranslatedValues("per_week"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                    child: Text(
                      LocalizationMap.getTranslatedValues("per_month"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                    child: Text(
                      LocalizationMap.getTranslatedValues("per_year"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                  child: Text(
                    LocalizationMap.getTranslatedValues("amount"),
                    style: R.textStyles.poppins(
                      fontSize: 10.sp,
                      color: R.colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                  child: Text(
                    "2 times",
                    style: R.textStyles.poppins(
                      fontSize: 10.sp,
                      color: R.colors.boldGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                  child: Text(
                    "15 times",
                    style: R.textStyles.poppins(
                      fontSize: 10.sp,
                      color: R.colors.boldGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                  child: Text(
                    "180 times",
                    style: R.textStyles.poppins(
                      fontSize: 10.sp,
                      color: R.colors.boldGrey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            )),
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.refresh,
                  color: R.colors.primaryColor,
                  size: 23,
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    LocalizationMap.getTranslatedValues(subTitle2),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: R.textStyles.poppins(
                      fontSize: 12.5.sp,
                      color: R.colors.boldGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            )),
        Row(
          children: [
            Expanded(
                child: CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 12.0,
              percent: 0.1,
              reverse: true,
              center: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "4",
                    style: R.textStyles.poppins(
                      fontSize: 14.sp,
                      color: R.colors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    LocalizationMap.getTranslatedValues("times"),
                    style: R.textStyles.poppins(
                      fontSize: 8.sp,
                      color: R.colors.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    LocalizationMap.getTranslatedValues("avg_per_week"),
                    style: R.textStyles.poppins(
                      fontSize: 5.sp,
                      color: R.colors.boldGrey,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              backgroundColor: R.colors.hintColor.withOpacity(0.15),
              progressColor: R.colors.primaryColor,
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                    child: Text(
                      LocalizationMap.getTranslatedValues("time"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                    child: Text(
                      LocalizationMap.getTranslatedValues("per_week"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                    child: Text(
                      LocalizationMap.getTranslatedValues("per_month"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 2, bottom: 2),
                    child: Text(
                      LocalizationMap.getTranslatedValues("per_year"),
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "%${LocalizationMap.getTranslatedValues("age")}",
                    style: R.textStyles.poppins(
                      fontSize: 10.sp,
                      color: R.colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "2 times",
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "15 times",
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      "180 times",
                      style: R.textStyles.poppins(
                        fontSize: 10.sp,
                        color: R.colors.boldGrey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../resources/resources.dart';

class PregnancyTracker2 extends StatefulWidget {
  const PregnancyTracker2({super.key});

  @override
  State<PregnancyTracker2> createState() => _PregnancyTracker2State();
}

class _PregnancyTracker2State extends State<PregnancyTracker2> {
  List<Map<String, dynamic>> data = [
    {
      'weeks': "23",
      'days': '6',
      'baby_size': "11.23 Inc",
      'pregnancy_%': "57%"
    },
    {
      'weeks': "23",
      'days': '6',
      'baby_size': "11.23 Inc",
      'pregnancy_%': "57%"
    },
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: R.colors.white,
      body: SafeArea(
        child: SizedBox(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -mediaQuery.size.height * 0.1,
                right: -mediaQuery.size.width * 0.1,
                child: SizedBox(
                  width: mediaQuery.size.width * 0.5,
                  child: Image.asset(R.images.jelly),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back,
                            color: R.colors.black,
                            size: 25,
                          )),
                      Text(
                        LocalizationMap.getTranslatedValues(
                            "pregnancy_tracker"),
                        textAlign: TextAlign.center,
                        style: R.textStyles.poppins(
                          color: R.colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 40,
                          width: 40,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          child: Image.asset(
                            R.images.menuIcon,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      LocalizationMap.getTranslatedValues("result"),
                      textAlign: TextAlign.start,
                      style: R.textStyles.poppins(
                        color: R.colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: RichText(
                        text: TextSpan(
                            style: R.textStyles.poppins(
                              color: R.colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            children: [
                          TextSpan(
                              text: LocalizationMap.getTranslatedValues(
                                  "You_are_currently_at_week")),
                          TextSpan(
                            text: LocalizationMap.getTranslatedValues(
                                "22_weeks_6_days_or_5_months_7_days"),
                            style: R.textStyles.poppins(
                              color: R.colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextSpan(
                              text: LocalizationMap.getTranslatedValues(
                                  "of_pregnancy"))
                        ])),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columnSpacing: 30,
                          columns: [
                            DataColumn(
                              label: Text(
                                LocalizationMap.getTranslatedValues("weeks"),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                LocalizationMap.getTranslatedValues("days"),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                LocalizationMap.getTranslatedValues(
                                    "baby_size"),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                LocalizationMap.getTranslatedValues(
                                    "pregnancy_%"),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                          rows: data.map((record) {
                            return DataRow(cells: [
                              DataCell(Text(
                                record['weeks'].toString(),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                              DataCell(Text(
                                record['days'],
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                              DataCell(Text(
                                record['baby_size'].toString(),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                              DataCell(Text(
                                record['pregnancy_%'].toString(),
                                textAlign: TextAlign.center,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                            ]);
                          }).toList(),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

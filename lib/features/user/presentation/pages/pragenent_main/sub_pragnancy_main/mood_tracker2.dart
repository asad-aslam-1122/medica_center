import 'package:flutter/material.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/resources.dart';

class MoodTracker2 extends StatefulWidget {
  const MoodTracker2({super.key});

  @override
  State<MoodTracker2> createState() => _MoodTracker2State();
}

class _MoodTracker2State extends State<MoodTracker2> {
  TextEditingController newWeightTC = TextEditingController();
  FocusNode newWeightFN = FocusNode();

  List<Map<String, dynamic>> data = [
    {'dateTime': "Today 11:34", 'emotions': 'Happy 😊\nCheerfull'},
    {'dateTime': "Yesterday 11:34", 'emotions': 'Happy 😊\nCheerfull'},
  ];

  @override
  void initState() {
    super.initState();
    DummyList.tempList2.clear();
  }

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
                        LocalizationMap.getTranslatedValues("mood_tracker"),
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
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        LocalizationMap.getTranslatedValues("journal"),
                        textAlign: TextAlign.center,
                        style: R.textStyles.poppins(
                          color: R.colors.black,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: DataTable(
                        columns: [
                          DataColumn(
                            label: Text(
                              LocalizationMap.getTranslatedValues(
                                  "date_and_time"),
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
                              LocalizationMap.getTranslatedValues("emotions"),
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
                              record['dateTime'].toString(),
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
                              record['emotions'],
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget moodTypeSample(String title) {
    return GestureDetector(
      onTap: () {
        DummyList.tempList2.add(title);
        setState(() {});
      },
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              width: 1,
              color: R.colors.secondaryColor,
            ),
            color: DummyList.tempList2.contains(title)
                ? R.colors.secondaryColor
                : R.colors.white,
          ),
          child: Flexible(
            child: Text(
              LocalizationMap.getTranslatedValues(title),
              style: R.textStyles.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: DummyList.tempList2.contains(title)
                      ? R.colors.white
                      : R.colors.secondaryColor),
            ),
          )),
    );
  }
}

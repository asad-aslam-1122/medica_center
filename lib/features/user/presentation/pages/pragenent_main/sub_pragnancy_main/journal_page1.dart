import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/resources.dart';

class JournalPage extends StatefulWidget {
  const JournalPage({super.key});

  @override
  State<JournalPage> createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  bool hasClicked = false;

  List<Map<String, dynamic>> data = [
    {'dateTime': "Today 11:34", 'clicks': '2 times', 'kicks': "2"},
    {'dateTime': "Yesterday 11:34", 'clicks': '4 times', 'kicks': "2"},
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
                        LocalizationMap.getTranslatedValues("kick_counter"),
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
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      hasClicked = !hasClicked;
                      setState(() {});
                    },
                    child: CircleAvatar(
                      radius: 75,
                      backgroundColor: hasClicked
                          ? R.colors.primaryColor
                          : R.colors.secondaryColor,
                      child: SizedBox(
                        height: 70,
                        width: 70,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(R.images.journeyAdd),
                            Image.asset(
                              R.images.addIcon,
                              color: R.colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if (!hasClicked)
                    Text(
                      LocalizationMap.getTranslatedValues("kick_sub"),
                      textAlign: TextAlign.center,
                      style: R.textStyles.poppins(
                        color: R.colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  if (hasClicked)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat("hh:mm a").format(DateTime.now()),
                                textAlign: TextAlign.center,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "kicks",
                                textAlign: TextAlign.center,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                DateFormat("dd-MM-yyyy").format(DateTime.now()),
                                textAlign: TextAlign.center,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                DateFormat("EEE").format(DateTime.now()),
                                textAlign: TextAlign.center,
                                style: R.textStyles.poppins(
                                  color: R.colors.black,
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(
                    height: 30,
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
                              LocalizationMap.getTranslatedValues("clicks"),
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
                              LocalizationMap.getTranslatedValues("kicks"),
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
                              record['clicks'],
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
                              record['kicks'].toString(),
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
}

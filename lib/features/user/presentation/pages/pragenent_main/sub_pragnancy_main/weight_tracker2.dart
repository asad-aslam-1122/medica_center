import 'package:flutter/material.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../resources/resources.dart';
import '../../../../../global/widgets/global_widget.dart';

class WeightTracker2 extends StatefulWidget {
  const WeightTracker2({super.key});

  @override
  State<WeightTracker2> createState() => _WeightTracker2State();
}

class _WeightTracker2State extends State<WeightTracker2> {
  TextEditingController newWeightTC = TextEditingController();

  FocusNode newWeightFN = FocusNode();

  List<Map<String, dynamic>> data = [
    {'Date': "01 Oct", 'Weight': '61 Kg', 'Gain': "8", 'Weeks': "+ 3 Kg"},
    {'Date': "01 Oct", 'Weight': '61 Kg', 'Gain': "8", 'Weeks': "+ 3 Kg"},
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
                        LocalizationMap.getTranslatedValues("weight_tracker"),
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
                    height: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      LocalizationMap.getTranslatedValues(
                          "weight_before_pregnancy"),
                      textAlign: TextAlign.start,
                      style: R.textStyles.poppins(
                        color: R.colors.black,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GlobalWidget.customTextField(
                    hintText: "",
                    context: context,
                    controller: newWeightTC,
                    currentFocusNode: newWeightFN,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: DataTable(
                        columnSpacing: 40,
                        columns: [
                          DataColumn(
                            label: Text(
                              LocalizationMap.getTranslatedValues("date"),
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
                              LocalizationMap.getTranslatedValues("weight"),
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
                              LocalizationMap.getTranslatedValues("gain"),
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
                        ],
                        rows: data.map((record) {
                          return DataRow(cells: [
                            DataCell(Text(
                              record['Date'].toString(),
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
                              record['Weight'],
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
                              record['Gain'].toString(),
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
                              record['Weeks'].toString(),
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

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:medical_center/features/global/utils/global_utils.dart';
import 'package:medical_center/features/user/presentation/pages/dashboard/calender.dart';
import 'package:medical_center/features/user/presentation/pages/notifications/notifications.dart';
import 'package:medical_center/features/user/presentation/pages/profile/profile.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/resources.dart';
import '../../../../global/widgets/custom_drop_down.dart';
import '../../../../global/widgets/global_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DummyList.nextSevenDays.clear();
    getNextSevenDays();
    DummyList.tempList.clear();
    DummyList.tempList2.clear();
    DummyList.tempList3.clear();
  }

  int selectedOption = 0;

  String selectedDropDownValue = "select_symptoms";
  bool hasSelectedValue = false;

  String selectedDropDownValue2 = "select_medications";
  bool hasSelectedValue2 = false;

  String selectedDropDownValue3 = "select_contraceptive_method";
  bool hasSelectedValue3 = false;

  String selectedMood = "calm";
  String selectedMenstrual = "no_flow";

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: R.colors.white,
      appBar: AppBar(
        leadingWidth: 58,
        elevation: 20,
        shadowColor: R.colors.blackWithOpacity,
        backgroundColor: R.colors.white,
        surfaceTintColor: R.colors.white,
        leading: Builder(
          builder: (context) {
            return GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
                decoration: BoxDecoration(
                    color: R.colors.secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                    image:
                        DecorationImage(image: AssetImage(R.images.avatar1))),
              ),
            );
          },
        ),
        title: Text(
          LocalizationMap.getTranslatedValues("hello"),
          style: R.textStyles.poppins(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          Text(
            DateFormat("dd MMM").format(DateTime.now()),
            style: R.textStyles
                .poppins(fontSize: 12.sp, fontWeight: FontWeight.w500),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Calender(),
                  ));
            },
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
      drawer: Drawer(
        shadowColor: R.colors.blackWithOpacity,
        elevation: 12,
        width: mediaQuery.size.width * 0.8,
        surfaceTintColor: R.colors.primaryColor,
        backgroundColor: R.colors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      LocalizationMap.getTranslatedValues("logo"),
                      style: R.textStyles.poppins(
                        fontSize: 26.sp,
                        color: R.colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SizedBox(
                      height: 40,
                      width: 40,
                      child: Image.asset(
                        R.images.menuIcon,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.all(0),
                      margin: EdgeInsets.only(
                          left: 8,
                          right: mediaQuery.size.width * 0.2,
                          top: 8,
                          bottom: 12),
                      decoration: R.decoration.shadowDecoration(
                          radius: 8,
                          shadowColor: R.colors.white,
                          background: selectedOption == index
                              ? R.colors.white
                              : R.colors.primaryColor),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            selectedOption = index;
                          });

                          Future.delayed(
                            const Duration(
                              milliseconds: 300,
                            ),
                            () => drawerNavigatorManager(index: index),
                          );
                        },
                        splashColor: R.colors.white,
                        leading: SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            DummyList.drawerOptionsList[index].imagePath
                                .toString(),
                            color: selectedOption == index
                                ? R.colors.primaryColor
                                : R.colors.white,
                          ),
                        ),
                        title: Text(
                          LocalizationMap.getTranslatedValues(DummyList
                              .drawerOptionsList[index].titleText
                              .toString()),
                          style: R.textStyles.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: selectedOption == index
                                ? R.colors.primaryColor
                                : R.colors.white,
                          ),
                        ),
                      ));
                },
                itemCount: DummyList.drawerOptionsList.length,
              ))
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: DummyList.nextSevenDays
                    .map(
                      (dateTimeValue) => dayDateItem(date: dateTimeValue),
                    )
                    .toList()),
            const SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: DummyList.dashboardGraphList
                    .map(
                      (graphStats) => rowWithColorText(
                          color: graphStats.color ?? R.colors.white,
                          title: graphStats.titleText.toString()),
                    )
                    .toList()),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: mediaQuery.size.height * 0.2,
              width: mediaQuery.size.width,
              decoration: BoxDecoration(
                  color: R.colors.transparent,
                  image: DecorationImage(image: AssetImage(R.images.graph1))),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LocalizationMap.getTranslatedValues("mood"),
              style: R.textStyles.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            Text(
              LocalizationMap.getTranslatedValues("mood_sub"),
              style: R.textStyles.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: R.colors.hintColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: DummyList.dashboardMoodList
                    .map(
                      (mood) => GestureDetector(
                        onTap: () {
                          selectedMood =
                              mood.titleText.toString().toLowerCase();
                          setState(() {});
                        },
                        child: horizontalListItem(
                            canChangeItemColor: false,
                            selectedItem: selectedMood,
                            imagePath: mood.imagePath.toString(),
                            title: mood.titleText.toString()),
                      ),
                    )
                    .toList()),
            const SizedBox(
              height: 5,
            ),
            Text(
              LocalizationMap.getTranslatedValues("symptoms"),
              style: R.textStyles.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            Text(
              LocalizationMap.getTranslatedValues("symptoms_sub"),
              style: R.textStyles.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: R.colors.hintColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomDropDown(
              dropDownList: DummyList.symptomsList,
              selectedValue: selectedDropDownValue,
              hasShowList: hasSelectedValue,
              tempList2: DummyList.tempList2,
              onTab: () {},
            ),
            const SizedBox(
              height: 12,
            ),
            if (DummyList.tempList2.isNotEmpty || DummyList.tempList2 != [])
              SizedBox(
                width: mediaQuery.size.width,
                child: Visibility(
                  visible: true,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: List.generate(
                        DummyList.tempList2.length,
                        (index) => GlobalWidget.itemGeneratedList(
                            DummyList.tempList2[index])),
                  ),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: DummyList.dashboardBlockList
                  .map(
                    (blockData) => blockItem(
                        context: context,
                        title1: blockData.titleText1.toString(),
                        title2: blockData.titleText2.toString(),
                        subTitle1: blockData.subTitleText1.toString(),
                        subTitle2: blockData.subTitleText2.toString()),
                  )
                  .toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LocalizationMap.getTranslatedValues("menstrual_flow"),
              style: R.textStyles.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            Text(
              LocalizationMap.getTranslatedValues(
                  "what_is_the_intensity_of_your_period"),
              style: R.textStyles.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: R.colors.hintColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: DummyList.dashboardMenstrualList
                    .map(
                      (menstrualItem) => GestureDetector(
                        onTap: () {
                          selectedMenstrual =
                              menstrualItem.titleText.toString().toLowerCase();
                          setState(() {});
                        },
                        child: horizontalListItem(
                            canChangeItemColor: true,
                            selectedItem: selectedMenstrual,
                            imagePath: menstrualItem.imagePath.toString(),
                            title: menstrualItem.titleText.toString()),
                      ),
                    )
                    .toList()),
            const SizedBox(
              height: 10,
            ),
            Text(
              LocalizationMap.getTranslatedValues("medications"),
              style: R.textStyles.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            Text(
              LocalizationMap.getTranslatedValues(
                  "what_medications_are_you_using"),
              style: R.textStyles.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: R.colors.hintColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomDropDown(
              dropDownList: DummyList.medicationsList,
              selectedValue: selectedDropDownValue2,
              hasShowList: hasSelectedValue2,
              tempList2: DummyList.tempList,
              onTab: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            if (DummyList.tempList.isNotEmpty || DummyList.tempList != [])
              SizedBox(
                width: mediaQuery.size.width,
                child: Visibility(
                  visible: true,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: List.generate(
                        DummyList.tempList.length,
                        (index) => GlobalWidget.itemGeneratedList(
                            DummyList.tempList[index])),
                  ),
                ),
              ),
            const SizedBox(
              height: 10,
            ),
            Text(
              LocalizationMap.getTranslatedValues("contraceptive_method"),
              style: R.textStyles.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            Text(
              LocalizationMap.getTranslatedValues(
                  "what_contraceptive_method_are_you_using"),
              style: R.textStyles.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: R.colors.hintColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            CustomDropDown(
              dropDownList: DummyList.contraceptiveList,
              selectedValue: selectedDropDownValue3,
              hasShowList: hasSelectedValue3,
              tempList2: DummyList.tempList3,
              onTab: () {},
            ),
            const SizedBox(
              height: 15,
            ),
            if (DummyList.tempList3.isNotEmpty || DummyList.tempList3 != [])
              SizedBox(
                width: mediaQuery.size.width,
                child: Visibility(
                  visible: true,
                  child: Wrap(
                    alignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runAlignment: WrapAlignment.start,
                    children: List.generate(
                        DummyList.tempList3.length,
                        (index) => GlobalWidget.itemGeneratedList(
                            DummyList.tempList3[index])),
                  ),
                ),
              ),
            const SizedBox(
              height: 15,
            ),
            Text(
              LocalizationMap.getTranslatedValues("write_note"),
              style: R.textStyles.poppins(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: R.colors.black,
              ),
            ),
            Text(
              LocalizationMap.getTranslatedValues("explain_your_day"),
              style: R.textStyles.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: R.colors.hintColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: R.decoration
                  .shadowDecoration(radius: 12, background: R.colors.white),
              child: TextFormField(
                  style: R.textStyles.poppins(
                      fontSize: 14.sp,
                      color: R.colors.black,
                      fontWeight: FontWeight.w400),
                  maxLines: 5,
                  minLines: 4,
                  decoration:
                      R.decoration.fieldDecoration(hintText: "write_note")),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          GlobalUtils.mediaAlertDialog(context);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        backgroundColor: R.colors.secondaryColor,
        elevation: 8,
        child: SizedBox(
          height: 32,
          width: 32,
          child: Image.asset(R.images.contact),
        ),
      ),
    );
  }

  Widget blockItem(
      {required BuildContext context,
      required String title1,
      required String title2,
      required String subTitle1,
      required String subTitle2}) {
    final mediaQuery = MediaQuery.of(context);

    return Expanded(
      child: SizedBox(
        height: mediaQuery.size.height * 0.12,
        child: Column(
          children: [
            Text(
              LocalizationMap.getTranslatedValues(title1),
              style: R.textStyles.poppins(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: R.colors.black,
              ),
            ),
            Text(
              LocalizationMap.getTranslatedValues(subTitle1),
              style: R.textStyles.poppins(
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: R.colors.hintColor,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  LocalizationMap.getTranslatedValues(subTitle2),
                  style: R.textStyles.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: R.colors.hintColor,
                  ),
                ),
                RotatedBox(
                  quarterTurns: 1,
                  child: SizedBox(
                    height: 15,
                    width: 15,
                    child: Divider(
                      color: R.colors.black,
                    ),
                  ),
                ),
                Text(
                  LocalizationMap.getTranslatedValues(title2),
                  style: R.textStyles.poppins(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: R.colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void getNextSevenDays() {
    DateTime today = DateTime.now().toLocal();

    for (int i = 0; i < 7; i++) {
      DummyList.nextSevenDays.add(today.add(Duration(days: i)));
    }
  }

  Widget horizontalListItem(
      {required String imagePath,
      required String title,
      required String selectedItem,
      required bool canChangeItemColor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: R.decoration.shadowDecoration(
              radius: 8,
              background: selectedItem == title
                  ? R.colors.secondaryColor
                  : R.colors.white),
          child: Center(
            child: canChangeItemColor
                ? Image.asset(
                    imagePath,
                    color: selectedItem == title
                        ? R.colors.white
                        : R.colors.secondaryColor,
                  )
                : Image.asset(imagePath),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Text(
            LocalizationMap.getTranslatedValues(title),
            style: R.textStyles.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w500,
              color: R.colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget dayDateItem({required DateTime date}) {
    String date1 = DateFormat("dd").format(date.toLocal());
    String day1 = DateFormat("EEE").format(date.toLocal());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
          ),
          child: Text(
            day1[0],
            style: R.textStyles.poppins(
              fontSize: 12.sp,
              fontWeight:
                  DateFormat("EEE").format(DateTime.now().toLocal()) == day1
                      ? FontWeight.w700
                      : FontWeight.w500,
              color: R.colors.black,
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor:
              DateFormat("dd").format(DateTime.now().toLocal()) == date1
                  ? R.colors.secondaryColor
                  : R.colors.blackWithOpacity,
          radius: 18,
          child: Text(
            date1,
            style: R.textStyles.poppins(
              fontSize: 12.sp,
              fontWeight:
                  DateFormat("dd").format(DateTime.now().toLocal()) == date1
                      ? FontWeight.w700
                      : FontWeight.w500,
              color: DateFormat("dd").format(DateTime.now().toLocal()) == date1
                  ? R.colors.white
                  : R.colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget rowWithColorText({required Color color, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 10,
          backgroundColor: color,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: Text(
            LocalizationMap.getTranslatedValues(title),
            style: R.textStyles.poppins(
              fontSize: 8.sp,
              fontWeight: FontWeight.w600,
              color: R.colors.black,
            ),
          ),
        ),
      ],
    );
  }

  void drawerNavigatorManager({required int index}) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            ));
        break;
      case 1:
        debugPrint("Delete Data");
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
        break;
      case 2:
        debugPrint("Share Data");
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(),));
        break;
      case 3:
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Notifications(),
            ));
        break;
      case 4:
        debugPrint("Phase 2");
        break;
      default:
        debugPrint("Logout");
    }
  }
}

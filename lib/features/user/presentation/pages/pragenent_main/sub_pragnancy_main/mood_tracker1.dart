import 'package:flutter/material.dart';
import 'package:medical_center/features/global/const/dummy_list.dart';
import 'package:medical_center/features/global/widgets/global_widget.dart';
import 'package:medical_center/features/user/presentation/pages/pragenent_main/sub_pragnancy_main/mood_tracker2.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/resources.dart';

class MoodTracker1 extends StatefulWidget {
  const MoodTracker1({super.key});

  @override
  State<MoodTracker1> createState() => _MoodTracker1State();
}

class _MoodTracker1State extends State<MoodTracker1> {
  TextEditingController newWeightTC = TextEditingController();
  FocusNode newWeightFN = FocusNode();

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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      LocalizationMap.getTranslatedValues(
                          "how_are_you_feeling_right_now"),
                      textAlign: TextAlign.start,
                      style: R.textStyles.poppins(
                        color: R.colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      child: Wrap(
                    children: DummyList.moodTypeList
                        .map(
                          (moodType) => moodTypeSample(moodType),
                        )
                        .toList(),
                  )),
                  const Expanded(child: SizedBox()),
                  Center(
                    child: SizedBox(
                      height: 50,
                      width: mediaQuery.size.width * 0.3,
                      child: GlobalWidget.customButton(
                          borderRadius: 30,
                          title: "save",
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MoodTracker2(),
                                ));
                          }),
                    ),
                  ),
                  const Expanded(child: SizedBox()),
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
          child: Text(
            LocalizationMap.getTranslatedValues(title),
            style: R.textStyles.poppins(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: DummyList.tempList2.contains(title)
                    ? R.colors.white
                    : R.colors.secondaryColor),
          )),
    );
  }
}

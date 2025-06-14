import 'package:flutter/material.dart';
import 'package:medical_center/features/user/presentation/pages/pragenent_main/sub_pragnancy_main/weight_tracker2.dart';
import 'package:medical_center/resources/localization/localization.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../resources/resources.dart';
import '../../../../../global/widgets/global_widget.dart';

class WeightTracker1 extends StatefulWidget {
  const WeightTracker1({super.key});

  @override
  State<WeightTracker1> createState() => _WeightTracker1State();
}

class _WeightTracker1State extends State<WeightTracker1> {
  TextEditingController weightBeforeTC = TextEditingController();
  TextEditingController weightAfterTC = TextEditingController();

  FocusNode weightBeforeFN = FocusNode();
  FocusNode weightAfterFN = FocusNode();

  bool hasCheckReminder = true;

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
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const WeightTracker2(),
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
                      controller: weightBeforeTC,
                      currentFocusNode: weightBeforeFN,
                      nextFocusNode: weightAfterFN),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      LocalizationMap.getTranslatedValues("current_weight"),
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
                      controller: weightAfterTC,
                      currentFocusNode: weightAfterFN,
                      inputAction: TextInputAction.done),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Divider(
                      color: R.colors.hintColor.withOpacity(0.3),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      hasCheckReminder = !hasCheckReminder;
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              LocalizationMap.getTranslatedValues(
                                  "remind_to_check_weight"),
                              textAlign: TextAlign.start,
                              style: R.textStyles.poppins(
                                color: R.colors.black,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                              height: 35,
                              width: 35,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: R.decoration.shadowCircleDecoration(
                                background: hasCheckReminder
                                    ? R.colors.primaryColor
                                    : R.colors.white,
                                borderColor: hasCheckReminder
                                    ? R.colors.white
                                    : R.colors.blackWithOpacity
                                        .withOpacity(0.3),
                              ),
                              child: hasCheckReminder
                                  ? Center(
                                      child: Icon(
                                        Icons.check,
                                        size: 30,
                                        color: R.colors.white,
                                      ),
                                    )
                                  : const SizedBox())
                        ],
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

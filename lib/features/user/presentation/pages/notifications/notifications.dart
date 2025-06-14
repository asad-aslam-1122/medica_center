import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../resources/localization/localization.dart';
import '../../../../../resources/resources.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: R.colors.white,
        appBar: AppBar(
          backgroundColor: R.colors.white,
          surfaceTintColor: R.colors.white,
          centerTitle: true,
          title: Text(
            LocalizationMap.getTranslatedValues("notifications"),
            style: R.textStyles.poppins(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SizedBox(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: ListView(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  LocalizationMap.getTranslatedValues("today"),
                  style: R.textStyles.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          R.colors.blackWithOpacity.withOpacity(0.04),
                      child: Center(
                          child: Icon(
                        Icons.calendar_month_outlined,
                        color: R.colors.primaryColor,
                        size: 20,
                      )),
                    ),
                    title: Text(
                      "Day ${index + 1} Of Period",
                      style: R.textStyles.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "Have a good day!",
                      style: R.textStyles.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: R.colors.hintColor.withOpacity(0.5)),
                    ),
                    trailing: Text(
                      "1h",
                      style: R.textStyles.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: R.colors.hintColor.withOpacity(0.5)),
                    ),
                  );
                },
                itemCount: 5,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Text(
                  LocalizationMap.getTranslatedValues("yesterday"),
                  style: R.textStyles.poppins(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor:
                          R.colors.blackWithOpacity.withOpacity(0.04),
                      child: Center(
                          child: Icon(
                        Icons.calendar_month_outlined,
                        color: R.colors.primaryColor,
                        size: 20,
                      )),
                    ),
                    title: Text(
                      "Day ${index + 1} Of Period",
                      style: R.textStyles.poppins(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      "Have a good day!",
                      style: R.textStyles.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: R.colors.hintColor.withOpacity(0.5)),
                    ),
                    trailing: Text(
                      "1h",
                      style: R.textStyles.poppins(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: R.colors.hintColor.withOpacity(0.5)),
                    ),
                  );
                },
                itemCount: 5,
              )
            ],
          ),
        ));
  }
}

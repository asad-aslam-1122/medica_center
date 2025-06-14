import 'package:flutter/material.dart';
import 'package:medical_center/features/user/presentation/pages/notifications/notifications.dart';
import 'package:medical_center/features/user/presentation/pages/setting/setting_main.dart';

import '../../resources/resources.dart';
import '../user/presentation/pages/dashboard/dashboard.dart';
import '../user/presentation/pages/graph_chart/graph_chat.dart';
import '../user/presentation/pages/pragenent_main/pragenent_dashboard.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Widget> dashboardBodies = [
    const Dashboard(),
    const GraphChat(),
    const PregnancyDashboard(),
    const Notifications(),
    const MainSetting()
  ];

  List<String> bottomIcons = [
    R.images.home,
    R.images.signal,
    R.images.calender,
    R.images.notification,
    R.images.setting,
  ];

  int dashBoardIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: R.colors.white,
      child: SafeArea(
        top: true,
        bottom: true,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: dashboardBodies[dashBoardIndex],
          bottomNavigationBar: customBottomNavigationBar(context),
        ),
      ),
    );
  }

  Widget customBottomNavigationBar(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Card(
      elevation: 8,
      color: R.colors.white,
      shadowColor: R.colors.white,
      child: SizedBox(
        height: 50,
        width: mediaQuery.size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: bottomIcons.asMap().entries.map((entry) {
            int index = entry.key;
            String icon = entry.value;
            return GestureDetector(
              onTap: () {
                dashBoardIndex = index;
                setState(() {});
              },
              child: Container(
                height: 50,
                width: 50,
                margin: const EdgeInsets.symmetric(vertical: 2),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: dashBoardIndex == index
                              ? R.colors.blackWithOpacity
                              : R.colors.white,
                          blurStyle: BlurStyle.outer,
                          blurRadius: 3,
                          spreadRadius: 2)
                    ],
                    color: dashBoardIndex == index
                        ? R.colors.primaryColorWithOpacity
                        : R.colors.transparent),
                padding: EdgeInsets.all(dashBoardIndex == index ? 10 : 8),
                child: Image.asset(icon),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

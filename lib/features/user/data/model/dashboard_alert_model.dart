import 'package:flutter/material.dart';
import 'package:medical_center/features/user/domain/entity/dashboard_alert_entity.dart';

class DashboardAlertModel extends DashboardAlertEntity {
  DashboardAlertModel({
    String? title,
    String? imagePath,
    VoidCallback? onTab,
  }) : super(title: title, imagePath: imagePath, onTab: onTab);
}

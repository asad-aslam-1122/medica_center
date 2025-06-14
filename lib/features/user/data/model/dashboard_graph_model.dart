import 'package:flutter/material.dart';

import '../../domain/entity/dashboard_graph_entity.dart';

class DashboardGraphModel extends DashboardGraphEntity {
  DashboardGraphModel({
    String? titleText,
    Color? color,
  }) : super(
          titleText: titleText,
          color: color,
        );
}

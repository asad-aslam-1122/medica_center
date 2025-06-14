import 'package:medical_center/features/user/domain/entity/dashboardBlockEntity.dart';

class DashboardBlockModel extends DashboardBlockEntity {
  DashboardBlockModel({
    String? titleText1,
    String? titleText2,
    String? subTitleText1,
    String? subTitleText2,
  }) : super(
            subTitleText1: subTitleText1,
            titleText1: titleText1,
            subTitleText2: subTitleText2,
            titleText2: titleText2);
}

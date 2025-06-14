import 'package:equatable/equatable.dart';

class DashboardBlockEntity extends Equatable {
  final String? titleText1;
  final String? titleText2;
  final String? subTitleText1;
  final String? subTitleText2;

  const DashboardBlockEntity(
      {this.subTitleText1,
      this.subTitleText2,
      this.titleText1,
      this.titleText2});

  @override
  // TODO: implement props
  List<Object?> get props => [
        titleText1,
        titleText2,
        subTitleText1,
        subTitleText2,
      ];
}

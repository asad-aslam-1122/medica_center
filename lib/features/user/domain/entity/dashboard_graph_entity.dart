import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DashboardGraphEntity extends Equatable {
  final String? titleText;

  final Color? color;

  const DashboardGraphEntity({this.titleText, this.color});

  @override
  // TODO: implement props
  List<Object?> get props => [
        titleText,
        color,
      ];
}

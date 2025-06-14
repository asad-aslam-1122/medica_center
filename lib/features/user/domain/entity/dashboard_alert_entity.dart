import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class DashboardAlertEntity extends Equatable {
  final String? title;
  final String? imagePath;
  final VoidCallback? onTab;

  const DashboardAlertEntity({this.title, this.imagePath, this.onTab});

  @override
  // TODO: implement props
  List<Object?> get props => [title, imagePath, onTab];
}

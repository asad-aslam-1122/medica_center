import 'package:equatable/equatable.dart';

class MoodEntity extends Equatable {
  final String? titleText;

  final String? imagePath;

  const MoodEntity({this.titleText, this.imagePath});

  @override
  // TODO: implement props
  List<Object?> get props => [
        titleText,
        imagePath,
      ];
}

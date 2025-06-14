import 'package:medical_center/features/user/domain/entity/mood_entity.dart';

class MoodModel extends MoodEntity {
  MoodModel({
    String? titleText,
    String? imagePath,
  }) : super(
          titleText: titleText,
          imagePath: imagePath,
        );
}

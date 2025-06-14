import 'package:medical_center/features/user/domain/entity/mood_entity.dart';

import '../../../resources/resources.dart';
import '../../user/domain/entity/dashboardBlockEntity.dart';
import '../../user/domain/entity/dashboard_alert_entity.dart';
import '../../user/domain/entity/dashboard_graph_entity.dart';

class DummyList {
  static List<String> tempList = [];
  static List<String> tempList2 = [];
  static List<String> tempList3 = [];
  static List<DateTime> nextSevenDays = [];
  static List<DateTime> pickDatesList = [
    DateTime(DateTime.now().year, DateTime.now().month, 1),
    DateTime(DateTime.now().year, DateTime.now().month, 5),
    DateTime(DateTime.now().year, DateTime.now().month, 14),
    DateTime(DateTime.now().year, DateTime.now().month, 29),
    DateTime(DateTime.now().year, DateTime.now().month, 24),
  ];

  static List<DashboardAlertEntity> alertMediaList = [
    DashboardAlertEntity(
        title: "whatsapp", imagePath: R.images.whatsapp, onTab: () {}),
    DashboardAlertEntity(
      title: "messenger",
      imagePath: R.images.messenger,
      onTab: () {},
    ),
    DashboardAlertEntity(
      title: "voice_call",
      imagePath: R.images.voiceCall,
      onTab: () {},
    ),
    DashboardAlertEntity(
      title: "chat",
      imagePath: R.images.sms,
      onTab: () {},
    ),
  ];

  static List<DashboardBlockEntity> dashboardBlockList = const [
    DashboardBlockEntity(
      titleText1: "current_weight",
      subTitleText2: "51",
      titleText2: "kg",
      subTitleText1: "Did_you_loss_weight",
    ),
    DashboardBlockEntity(
      titleText1: "sleep",
      subTitleText2: "8",
      titleText2: "Hr’s",
      subTitleText1: "how_long_you_sleep",
    ),
  ];

  static List<String> pregnancyTrackerDropDownList = [
    "last_period",
    "current_period"
  ];

  static List<DashboardGraphEntity> dashboardGraphList = [
    DashboardGraphEntity(color: R.colors.secondaryColor, titleText: "period"),
    DashboardGraphEntity(
        color: R.colors.primaryColor, titleText: "fertile_period"),
    DashboardGraphEntity(color: R.colors.pink, titleText: "pregnancy"),
  ];

  static List<DashboardGraphEntity> graphMenstruationList = [
    DashboardGraphEntity(color: R.colors.primaryColor, titleText: "cycles"),
    DashboardGraphEntity(color: R.colors.orangeColor, titleText: "periods"),
    DashboardGraphEntity(color: R.colors.yellowColor, titleText: "weight"),
    DashboardGraphEntity(
        color: R.colors.secondaryColor, titleText: "temperature"),
  ];

  static List<DashboardGraphEntity> calenderStatsList = [
    DashboardGraphEntity(color: R.colors.secondaryColor, titleText: "period"),
    DashboardGraphEntity(
        color: R.colors.secondaryColor.withOpacity(0.5),
        titleText: "ovulation_day"),
    DashboardGraphEntity(color: R.colors.pink, titleText: "pregnancy"),
    DashboardGraphEntity(
        color: R.colors.primaryColor, titleText: "fertile_period"),
  ];

  static List<String> moodTypeList = [
    "joy",
    "pain",
    "love",
    "fear",
    "anger",
    "boredom",
    "sadness",
    "cheerful",
    "surprise",
    "gratitude",
    "happiness",
    "affection",
    "enthusiasm",
    "excitement",
    "frustration",
    "contentment",
    "satisfaction",
    "indifference",
  ];

  static List<MoodEntity> settingOptionsList = [
    MoodEntity(
        imagePath: R.images.calenderOptions, titleText: "calendar_options"),
    MoodEntity(imagePath: R.images.security, titleText: "security"),
    MoodEntity(imagePath: R.images.backUp, titleText: "backup_and_restore"),
    MoodEntity(imagePath: R.images.measurement, titleText: "measure_units"),
    MoodEntity(
        imagePath: R.images.changeLanguage, titleText: "change_language"),
  ];

  static List<MoodEntity> drawerOptionsList = [
    MoodEntity(imagePath: R.images.userImg, titleText: "profile"),
    MoodEntity(imagePath: R.images.deleteIcon, titleText: "delete_data"),
    MoodEntity(imagePath: R.images.shareIcon, titleText: "share"),
    MoodEntity(
        imagePath: R.images.notificationIcon, titleText: "notifications"),
    MoodEntity(imagePath: R.images.starIcon, titleText: "phase2"),
    MoodEntity(imagePath: R.images.logoutIcon, titleText: "logout"),
  ];

  static List<MoodEntity> dashboardMoodList = [
    MoodEntity(imagePath: R.images.leaf, titleText: "calm"),
    MoodEntity(imagePath: R.images.smile, titleText: "happy"),
    MoodEntity(imagePath: R.images.sad, titleText: "sad"),
    MoodEntity(imagePath: R.images.happy, titleText: "energetic"),
    MoodEntity(imagePath: R.images.ugly, titleText: "irritable"),
  ];

  static List<MoodEntity> dashboardMenstrualList = [
    MoodEntity(imagePath: R.images.noFlow, titleText: "no_flow"),
    MoodEntity(imagePath: R.images.drop, titleText: "low"),
    MoodEntity(imagePath: R.images.normal, titleText: "normal"),
    MoodEntity(imagePath: R.images.medium, titleText: "medium"),
    MoodEntity(imagePath: R.images.heavy, titleText: "heavy"),
  ];

  static List<String> symptomsList = [
    "fatigue",
    "nausea",
    "cramps",
    "irritability",
    "breast_pain",
    "back_pain",
    "headaches",
    "bloating",
    "mood_swings",
    "food_cravings",
  ];
  static List<String> medicationsList = [
    "sleeping_pill",
    "Headache_pill",
  ];

  static List<String> contraceptiveList = [
    "IUD",
    "condom",
    "birth_control_pill",
    "emergency_contraceptive_pill",
    "specify_which_one",
  ];

  static List<String> monthsList = [
    "January ${DateTime.now().year}",
    "February ${DateTime.now().year}",
    "March ${DateTime.now().year}",
    "April ${DateTime.now().year}",
    "May ${DateTime.now().year}",
    "June ${DateTime.now().year}",
    "July ${DateTime.now().year}",
    "August ${DateTime.now().year}",
    "September ${DateTime.now().year}",
    "October ${DateTime.now().year}",
    "November ${DateTime.now().year}",
    "December ${DateTime.now().year}",
  ];

  static List<String> avatarList = [
    R.images.avatar1,
    R.images.avatar2,
    R.images.avatar3,
    R.images.avatar4,
    R.images.avatar5,
    R.images.avatar6,
  ];
}

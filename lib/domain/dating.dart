import 'package:seeks_app_prototype/domain/media.dart';

class DatingItemEntity {
  String id;
  String userId;
  String username;
  String userImage;
  ImageType userImageType;
  String title;
  DatingStatusType status;
  String signupCount;
  String payment;
  Map<String, DatingInfoLabelEntity> labels;
  DatingInfoTimeEntity datingInfoTime;
  dynamic image;
  ImageType imageType;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? deadlineTime;
  bool isCurrentUserSignUp;

  DatingItemEntity({
    required this.id,
    required this.datingInfoTime,
    this.labels = const <String, DatingInfoLabelEntity>{},
    this.username = "",
    this.title = "一起看電影",
    this.status = DatingStatusType.PAITING,
    this.signupCount = "100人報名",
    this.payment = "-1000元",
    this.userId = "",
    this.userImage = "assets/images/female-user.png",
    this.userImageType = ImageType.ASSET,
    this.image = "assets/images/splash_1.jpg",
    this.imageType = ImageType.ASSET,
    this.startTime,
    this.endTime,
    this.deadlineTime,
    this.isCurrentUserSignUp = false,
  });
}

class DatingInfoEntity {
  String id;
  String userId;
  String username;
  String title;
  String city;
  String description;
  String location;
  DateTime? startTime;
  DateTime? endTime;
  DateTime? deadlineTime;
  double? latitude;
  double? longitude;
  Map<String, DatingInfoLabelEntity> labels;
  String userImage;
  ImageType userImageType;
  List<DatingInfoImageEntity> images;
  DatingInfoTimeEntity datingInfoTime;
  String? paymentType;
  int? payment;
  DatingStatusType status;
  List<String> signUpUserIds;

  DatingInfoEntity({
    required this.id,
    required this.userId,
    this.username = "",
    this.title = "一起看電影",
    this.city = "台北市",
    this.description = "歡迎一起約會，一起讀書",
    this.location = "台灣台北市信義區華納威秀 CASHBANK",
    this.startTime,
    this.endTime,
    this.userImage = "assets/images/female-user.png",
    this.userImageType = ImageType.ASSET,
    this.images = const [],
    this.labels = const <String, DatingInfoLabelEntity>{},
    this.signUpUserIds = const [],
    this.latitude,
    this.longitude,
    required this.datingInfoTime,
    this.paymentType,
    this.payment,
    this.status = DatingStatusType.PAITING,
  });
}

class DatingInfoTimeEntity {
  String datingWeek;
  String datingDate;
  String datingRange;
  String deadlineWeek;
  String deadlineDate;
  String deadlineTime;

  DatingInfoTimeEntity({
    this.datingWeek = "週日",
    this.datingDate = "6月27日",
    this.datingRange = "14:00 - 17:00",
    this.deadlineWeek = "週日",
    this.deadlineDate = "6月27日",
    this.deadlineTime = "13:00",
  });
}

class DatingInfoLabelEntity {
  String name;
  String key;
  dynamic value;
  String iconType;

  DatingInfoLabelEntity({
    required this.name,
    required this.key,
    this.value,
    required this.iconType,
  });
}

class DatingInfoImageEntity {
  String id;
  dynamic image;
  ImageType imageType;
  DateTime? latestTime;
  bool? isPrivacy = false;

  DatingInfoImageEntity({
    required this.id,
    this.image = "assets/images/splash_2.jpg",
    this.imageType = ImageType.ASSET,
    this.latestTime,
    this.isPrivacy,
  });
}

enum DatingStatusType {
  PAITING,
  PAITING_SUCCESS,
  PAITING_FAILD,
  SIGNUP,
  FINISH,
}

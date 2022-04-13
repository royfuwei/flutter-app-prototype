import 'package:seeks_app_prototype/domain/media.dart';

class DatingItemEntity {
  String id;
  String? type;
  String image;
  ImageType imageType;
  DateTime? startTime;
  DateTime? endTime;
  bool? status = true;

  DatingItemEntity({
    required this.id,
    this.type,
    this.image = "assets/images/splash_1.jpg",
    this.imageType = ImageType.ASSET,
    this.startTime,
    this.endTime,
    this.status,
  });
}

/* class DatingItemEntity {
  String username;
  Uint8List userImage;
  Uint8List coverImage;
  String title;
  DateTime startTime;
  DateTime endTime;
  int signupCount;
  int payment;
  String paymentType;

  DatingItemEntity({
    required this.username,
    required this.userImage,
    required this.coverImage,
    required this.title,
    required this.startTime,
    required this.endTime,
    required this.signupCount,
    required this.paymentType,
    required this.payment,
  });
} */
class DatingInfoEntity {
  String id;
  String userId;
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
  List<DatingInfoImageEntity> images;
  DatingInfoTimeEntity datingInfoTime;
  String? paymentType;
  int? payment;
  String? status;

  DatingInfoEntity({
    required this.id,
    required this.userId,
    this.title = "一起看電影",
    this.city = "台北市",
    this.description = "歡迎一起約會，一起讀書",
    this.location = "台灣台北市信義區華納威秀 CASHBANK",
    this.startTime,
    this.endTime,
    this.images = const [],
    this.labels = const <String, DatingInfoLabelEntity>{},
    this.latitude,
    this.longitude,
    required this.datingInfoTime,
    this.paymentType,
    this.payment,
    this.status,
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
  String image;
  ImageType imageType;
  DateTime? latestTime;
  bool? isPrivacy = false;

  DatingInfoImageEntity({
    required this.id,
    this.image = "assets/images//splash_2.jpg",
    this.imageType = ImageType.ASSET,
    this.latestTime,
    this.isPrivacy,
  });
}

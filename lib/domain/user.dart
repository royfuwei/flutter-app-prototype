import 'package:seeks_app_prototype/domain/media.dart';

class UserInfoEntity {
  String id;
  String username;
  int age;
  String city;
  String description;
  List<UserInfoImageEntity> images;
  List<UserInfoListEntity> infoList;
  UserInfoLabelsEntity habbyLabels;
  DateTime? latestTime;
  bool? status = true;

  UserInfoEntity({
    required this.id,
    required this.habbyLabels,
    this.username = "username",
    this.age = 25,
    this.city = "",
    this.description = "",
    this.images = const [],
    this.infoList = const [],
    this.latestTime,
    this.status,
  });
}

class UserInfoImageEntity {
  String id;
  dynamic image;
  ImageType imageType;
  DateTime? latestTime;
  bool? isPrivacy = false;

  UserInfoImageEntity({
    required this.id,
    this.image = "assets/images/male-user.png",
    this.imageType = ImageType.ASSET,
    this.latestTime,
    this.isPrivacy,
  });
}

class UserInfoListEntity {
  String name;
  List<UserInfoListContentEntity>? contents;
  DateTime? latestTime;
  bool? isPrivacy = false;

  UserInfoListEntity({
    required this.name,
    this.contents = const [],
    this.latestTime,
    this.isPrivacy,
  });
}

class UserInfoListContentEntity {
  String title;
  String name;
  dynamic value;
  DataType dateType;
  DateTime? latestTime;
  bool? isPrivacy = false;

  UserInfoListContentEntity({
    required this.title,
    required this.name,
    this.dateType = DataType.STRING,
    this.value,
    this.latestTime,
    this.isPrivacy,
  });
}

class UserInfoLabelsEntity {
  String name;
  dynamic value;
  DateTime? latestTime;
  bool? isPrivacy = false;
  List<UserInfoLabelsContentEntity> contents;

  UserInfoLabelsEntity({
    required this.name,
    this.contents = const [],
    this.value,
    this.latestTime,
    this.isPrivacy,
  });
}

class UserInfoLabelsContentEntity {
  String name;
  dynamic? value;
  DateTime? latestTime;

  UserInfoLabelsContentEntity({
    required this.name,
    this.value,
    this.latestTime,
  });
}

enum DataType {
  STRING,
  INT,
  DOUBLE,
  DATETIME,
}

enum EditingType {
  STRING,
  INT,
  DOUBLE,
  DATETIME,
}

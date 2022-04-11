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
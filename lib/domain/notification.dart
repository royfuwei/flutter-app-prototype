import 'package:seeks_app_prototype/domain/media.dart';

class NotifiItemEntity {
  String id;
  String? title;
  String? type;
  String image;
  ImageType imageType;
  DateTime? notifiTime;
  bool? status = true;

  NotifiItemEntity({
    required this.id,
    this.title,
    this.type,
    this.image = "assets/images/male-user.png",
    this.imageType = ImageType.ASSET,
    this.notifiTime,
    this.status,
  });
}

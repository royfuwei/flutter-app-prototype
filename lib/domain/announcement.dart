class AnnounBoardEntity {
  String id;
  String? type;
  String image;
  ImageType imageType;
  DateTime? startTime;
  DateTime? endTime;
  bool? status = true;

  AnnounBoardEntity({
    required this.id,
    this.type,
    this.image = "assets/images/splash_1.jpg",
    this.imageType = ImageType.ASSET,
    this.startTime,
    this.endTime,
    this.status,
  });
}

enum ImageType {
  URL,
  ASSET,
}

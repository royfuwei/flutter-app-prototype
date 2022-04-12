import 'package:seeks_app_prototype/domain/media.dart';

class ChatItemEntity {
  String id;
  String? username;
  String? message;
  String image;
  ImageType imageType;
  DateTime? latestTime;
  bool? status = true;

  ChatItemEntity({
    required this.id,
    this.username,
    this.message,
    this.image = "assets/images/male-user.png",
    this.imageType = ImageType.ASSET,
    this.latestTime,
    this.status,
  });
}

class ChatBubbleEntity {
  String id;
  String? username;
  String message;
  ChatMessageType messageType;
  String image;
  ImageType imageType;
  DateTime? timestamp;
  bool isCurrentUser;

  ChatBubbleEntity({
    required this.id,
    this.username,
    required this.message,
    this.messageType: ChatMessageType.TEXT,
    this.image = "assets/images/male-user.png",
    this.imageType = ImageType.ASSET,
    this.timestamp,
    this.isCurrentUser = true,
  });
}

enum ChatMessageType {
  TEXT,
  MEDIA,
}

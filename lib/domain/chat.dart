import 'package:seeks_app_prototype/domain/media.dart';

class ChatItemEntity {
  String id;
  String? userId;
  String? username;
  String? message;
  String userImage;
  ImageType userImageType;
  DateTime? latestTime;
  bool? status = true;

  ChatItemEntity({
    required this.id,
    this.userId,
    this.username,
    this.message,
    this.userImage = "assets/images/male-user.png",
    this.userImageType = ImageType.ASSET,
    this.latestTime,
    this.status,
  });
}

class ChatBubbleEntity {
  String id;
  String? username;
  String message;
  ChatMessageType messageType;
  String userImage;
  ImageType userImageType;
  DateTime? timestamp;
  bool isCurrentUser;

  ChatBubbleEntity({
    required this.id,
    this.username,
    required this.message,
    this.messageType: ChatMessageType.TEXT,
    this.userImage = "assets/images/male-user.png",
    this.userImageType = ImageType.ASSET,
    this.timestamp,
    this.isCurrentUser = true,
  });
}

enum ChatMessageType {
  TEXT,
  MEDIA,
}

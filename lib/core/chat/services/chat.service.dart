import 'package:seeks_app_prototype/domain/chat.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
part 'data.dart';

class ChatService {
  Future<List<ChatItemEntity>> getChatItemList() async {
    List<ChatItemEntity> results = [];
    chatItemMap.forEach((key, value) => results.add(value));
    return results;
  }

  Future<ChatItemEntity> getChatItemById(String id) async {
    return chatItemMap[id]!;
  }

  Future<List<ChatBubbleEntity>> getChatBubbleListById(String id) async {
    List<ChatBubbleEntity> results = [];
    results = chatBubbleListMap[id]!;
    return results;
  }
}

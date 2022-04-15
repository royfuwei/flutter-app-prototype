part of 'chat.service.dart';

Map<String, ChatItemEntity> chatItemMap = <String, ChatItemEntity>{
  "chat001": ChatItemEntity(
    id: "chat001",
    userId: "001",
    username: userInfoMap["001"]!.username,
    userImage: userInfoMap["001"]!.images[0].image,
    userImageType: userInfoMap["001"]!.images[0].imageType,
    message: chatBubbleListMap["chat001"]!.last.message,
  ),
  "chat002": ChatItemEntity(
    id: "chat002",
    userId: "002",
    username: userInfoMap["002"]!.username,
    userImage: userInfoMap["002"]!.images[0].image,
    userImageType: userInfoMap["002"]!.images[0].imageType,
    message: chatBubbleListMap["chat002"]!.last.message,
  ),
  "chat003": ChatItemEntity(
    id: "chat003",
    userId: "003",
    username: userInfoMap["003"]!.username,
    userImage: userInfoMap["003"]!.images[0].image,
    userImageType: userInfoMap["003"]!.images[0].imageType,
    message: chatBubbleListMap["chat003"]!.last.message,
  ),
};

Map<String, List<ChatBubbleEntity>> chatBubbleListMap =
    <String, List<ChatBubbleEntity>>{
  "chat001": [
    ChatBubbleEntity(
      id: "001",
      message: "你好!",
      isCurrentUser: false,
    ),
    ChatBubbleEntity(
      id: "002",
      message: "你好!",
      isCurrentUser: true,
    ),
  ],
  "chat002": [
    ChatBubbleEntity(
      id: "01",
      message: 'How was the concert?',
      isCurrentUser: false,
    ),
    ChatBubbleEntity(
      id: "02",
      message: 'Awesome! Next time you gotta come as well!',
      isCurrentUser: true,
    ),
    ChatBubbleEntity(
      id: "03",
      message: 'Ok, when is the next date?',
      isCurrentUser: false,
    ),
    ChatBubbleEntity(
      id: "04",
      message: 'They\'re playing on the 20th of November',
      isCurrentUser: true,
    ),
    ChatBubbleEntity(
      id: "05",
      message: 'Let\'s do it!',
      isCurrentUser: false,
    ),
    ChatBubbleEntity(
      id: "01",
      message: 'How was the concert?',
      isCurrentUser: false,
    ),
    ChatBubbleEntity(
      id: "02",
      message: 'Awesome! Next time you gotta come as well!',
      isCurrentUser: true,
    ),
    ChatBubbleEntity(
      id: "03",
      message: 'Ok, when is the next date?',
      isCurrentUser: false,
    ),
    ChatBubbleEntity(
      id: "04",
      message: 'They\'re playing on the 20th of November',
      isCurrentUser: true,
    ),
    ChatBubbleEntity(
      id: "01",
      message: 'How was the concert?',
      isCurrentUser: false,
    ),
    ChatBubbleEntity(
      id: "02",
      message: 'Awesome! Next time you gotta come as well!',
      isCurrentUser: true,
    ),
    ChatBubbleEntity(
      id: "03",
      message: 'Ok, when is the next date?',
      isCurrentUser: false,
    ),
    ChatBubbleEntity(
      id: "04",
      message: 'They\'re playing on the 20th of November',
      isCurrentUser: true,
    ),
  ],
  "chat003": [
    ChatBubbleEntity(
      id: "001",
      message: "安安 你好!",
      isCurrentUser: true,
    ),
    ChatBubbleEntity(
      id: "002",
      message: "可以認識你嗎？",
      isCurrentUser: true,
    ),
  ],
};

part of 'dating.service.dart';

Map<String, DatingInfoEntity> datingInfoMap = {
  "001": DatingInfoEntity(
    id: "001",
    userId: userInfoMap["001"]!.id,
    username: userInfoMap["001"]!.username,
    userImage: userInfoMap["001"]!.images[0].image,
    userImageType: userInfoMap["001"]!.images[0].imageType,
    title: "一起看電影",
    description: "我的綽號是「人魚公主」，絕對不是因為我有公主病，而是因為我非常喜歡大海，夢想是希望可以去遍所有的海島國家旅遊。",
    images: [
      DatingInfoImageEntity(id: "02", image: "assets/images/splash_2.jpg"),
      DatingInfoImageEntity(id: "03", image: "assets/images/splash_3.jpg"),
    ],
    datingInfoTime: DatingInfoTimeEntity(),
    status: "配對中",
    labels: <String, DatingInfoLabelEntity>{
      "datingDuration": DatingInfoLabelEntity(
        iconType: "access_time",
        name: "預計2hr",
        value: 60 * 60 * 2,
        key: "datingDuration",
      ),
      "signupCount": DatingInfoLabelEntity(
        iconType: "group_add",
        name: "100人報名",
        value: 100,
        key: "signupCount",
      ),
      "payment": DatingInfoLabelEntity(
        iconType: "money_outlined",
        name: "-1000元",
        value: -1000,
        key: "payment",
      ),
    },
  ),
  "002": DatingInfoEntity(
    id: "002",
    userId: userInfoMap["002"]!.id,
    username: userInfoMap["002"]!.username,
    userImage: userInfoMap["002"]!.images[0].image,
    userImageType: userInfoMap["002"]!.images[0].imageType,
    title: "一起吃飯",
    description: "我是個吃貨，住在中和，喜歡到樂華夜市吃小吃，目標是兩年內把夜市裡所有攤位都吃一遍！歡迎住在中和的貪吃鬼跟我一起挑戰！",
    images: [
      DatingInfoImageEntity(id: "03", image: "assets/images/splash_3.jpg"),
      DatingInfoImageEntity(id: "02", image: "assets/images/splash_2.jpg"),
    ],
    datingInfoTime: DatingInfoTimeEntity(),
    status: "配對中",
    labels: <String, DatingInfoLabelEntity>{
      "datingDuration": DatingInfoLabelEntity(
        iconType: "access_time",
        name: "預計3hr",
        value: 60 * 60 * 3,
        key: "datingDuration",
      ),
      "signupCount": DatingInfoLabelEntity(
        iconType: "group_add",
        name: "10人報名",
        value: 10,
        key: "signupCount",
      ),
      "payment": DatingInfoLabelEntity(
        iconType: "money_outlined",
        name: "1000元",
        value: 1000,
        key: "payment",
      ),
    },
  ),
  "003": DatingInfoEntity(
    id: "003",
    userId: userInfoMap["003"]!.id,
    username: userInfoMap["003"]!.username,
    userImage: userInfoMap["003"]!.images[0].image,
    userImageType: userInfoMap["003"]!.images[0].imageType,
    title: "一起吃飯,看電影",
    description:
        "我的外號是「米奇」，只因為換了去迪士尼戴米老鼠帽子的大頭貼，辦公室同事就幫我取了這個外號，希望可以找到願意讓我帶妳去迪士尼玩的米妮。",
    images: [
      DatingInfoImageEntity(id: "01", image: "assets/images/splash_1.jpg"),
      DatingInfoImageEntity(id: "02", image: "assets/images/splash_2.jpg"),
    ],
    datingInfoTime: DatingInfoTimeEntity(),
    status: "配對中",
    labels: <String, DatingInfoLabelEntity>{
      "datingDuration": DatingInfoLabelEntity(
        iconType: "access_time",
        name: "預計3hr",
        value: 60 * 60 * 3,
        key: "datingDuration",
      ),
      "signupCount": DatingInfoLabelEntity(
        iconType: "group_add",
        name: "10人報名",
        value: 10,
        key: "signupCount",
      ),
      "payment": DatingInfoLabelEntity(
        iconType: "money_outlined",
        name: "500元",
        value: 500,
        key: "payment",
      ),
    },
  ),
};

Map<String, DatingItemEntity> datingItemMap = {
  "001": DatingItemEntity(
    id: "001",
    image: datingInfoMap["001"]!.images[0].image,
    imageType: datingInfoMap["001"]!.images[0].imageType,
    userImage: datingInfoMap["001"]!.userImage,
    userImageType: datingInfoMap["001"]!.userImageType,
    datingInfoTime: datingInfoMap["001"]!.datingInfoTime,
    labels: datingInfoMap["001"]!.labels,
    title: datingInfoMap["001"]!.title,
    username: datingInfoMap["001"]!.username,
    status: datingInfoMap["001"]!.status!,
  ),
  "002": DatingItemEntity(
    id: "002",
    image: datingInfoMap["002"]!.images[0].image,
    imageType: datingInfoMap["002"]!.images[0].imageType,
    userImage: datingInfoMap["002"]!.userImage,
    userImageType: datingInfoMap["002"]!.userImageType,
    datingInfoTime: datingInfoMap["002"]!.datingInfoTime,
    labels: datingInfoMap["002"]!.labels,
    title: datingInfoMap["002"]!.title,
    username: datingInfoMap["002"]!.username,
    status: datingInfoMap["002"]!.status!,
  ),
  "003": DatingItemEntity(
    id: "003",
    image: datingInfoMap["003"]!.images[0].image,
    imageType: datingInfoMap["003"]!.images[0].imageType,
    userImage: datingInfoMap["003"]!.userImage,
    userImageType: datingInfoMap["003"]!.userImageType,
    datingInfoTime: datingInfoMap["003"]!.datingInfoTime,
    labels: datingInfoMap["003"]!.labels,
    title: datingInfoMap["003"]!.title,
    username: datingInfoMap["003"]!.username,
    status: datingInfoMap["003"]!.status!,
  ),
};

part of 'user.service.dart';

Map<String, UserInfoEntity> userInfoMap = {
  "001": UserInfoEntity(
    id: "001",
    username: "超可愛人魚公主",
    age: 22,
    city: "台北市",
    description: "我的綽號是「人魚公主」，絕對不是因為我有公主病，而是因為我非常喜歡大海，夢想是希望可以去遍所有的海島國家旅遊。",
    images: [
      UserInfoImageEntity(
        id: "01",
        image: "assets/images/female-user.png",
      ),
      UserInfoImageEntity(id: "02", image: "assets/images/splash_1.jpg"),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "女"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "看電影", value: "看電影"),
        UserInfoLabelsContentEntity(name: "爬山", value: "爬山"),
      ],
    ),
  ),
  "002": UserInfoEntity(
    id: "002",
    username: "Lala",
    age: 25,
    city: "台北市",
    description: "我是個吃貨，住在中和，喜歡到樂華夜市吃小吃，目標是兩年內把夜市裡所有攤位都吃一遍！歡迎住在中和的貪吃鬼跟我一起挑戰！",
    images: [
      UserInfoImageEntity(
        id: "01",
        image: "assets/images/female-user.png",
      ),
      UserInfoImageEntity(id: "02", image: "assets/images/splash_1.jpg"),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "女"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "爬山", value: "爬山"),
        UserInfoLabelsContentEntity(name: "聽音樂", value: "聽音樂"),
      ],
    ),
  ),
  "003": UserInfoEntity(
    id: "003",
    username: "米奇",
    age: 28,
    city: "台北市",
    description:
        "我的外號是「米奇」，只因為換了去迪士尼戴米老鼠帽子的大頭貼，辦公室同事就幫我取了這個外號，希望可以找到願意讓我帶妳去迪士尼玩的米妮。",
    images: [
      UserInfoImageEntity(id: "02", image: "assets/images/splash_1.jpg"),
      UserInfoImageEntity(
        id: "01",
        image: "assets/images/female-user.png",
      ),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "女"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "看電影", value: "看電影"),
        UserInfoLabelsContentEntity(name: "爬山", value: "爬山"),
        UserInfoLabelsContentEntity(name: "自由行", value: "自由行"),
      ],
    ),
  ),
};

List<DatingInfoEntity> userSignUpDating = [
  datingInfoMap["004"]!,
];

List<DatingInfoEntity> userProcessDating = [
  datingInfoMap["004"]!,
];

List<DatingInfoEntity> userHistoryDating = [
  datingInfoMap["004"]!,
];

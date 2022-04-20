part of 'user.service.dart';

Map<String, UserInfoEntity> userInfoMap = {
  "001": UserInfoEntity(
    id: "001",
    username: "Janie Chen",
    age: 22,
    city: "新北市",
    description: """
我喜歡研究服裝與飾品的穿搭，夢想可以設計自己的品牌服飾。
想要透過這裡認識和我一樣也喜歡時尚穿搭的朋友。
""",
    images: [
      UserInfoImageEntity(
          id: "01", image: "assets/images/test/users/Janie Chen.jpeg"),
      UserInfoImageEntity(id: "02", image: "assets/images/splash_1.jpg"),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "女性"),
          UserInfoListContentEntity(title: "居住地", name: "新北市"),
          UserInfoListContentEntity(title: "身高", name: "158"),
          UserInfoListContentEntity(title: "喜歡的類型", name: "喜歡男生"),
          UserInfoListContentEntity(title: "手機號碼", name: "0935622593"),
          UserInfoListContentEntity(title: "Email", name: "Janie@gmail.com"),
        ],
      ),
      UserInfoListEntity(
        name: "工作及教育背景",
        contents: [
          UserInfoListContentEntity(title: "學歷", name: "大學"),
          UserInfoListContentEntity(title: "工作", name: "服飾業"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "看電影", value: "看電影"),
        UserInfoLabelsContentEntity(name: "逛街", value: "逛街"),
        UserInfoLabelsContentEntity(name: "文創", value: "文創"),
        UserInfoLabelsContentEntity(name: "漫畫", value: "漫畫"),
      ],
    ),
  ),
  "002": UserInfoEntity(
    id: "002",
    username: "Yu萱",
    age: 25,
    city: "桃園市",
    description: """
你也喜歡健身嗎？喜歡的話可以一起出來運動唷！
我當拳擊手 你當沙包袋 (♡˙︶˙♡)
""",
    images: [
      UserInfoImageEntity(id: "01", image: "assets/images/test/users/Yu萱.jpeg"),
      UserInfoImageEntity(id: "02", image: "assets/images/splash_1.jpg"),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "女性"),
          UserInfoListContentEntity(title: "居住地", name: "桃園市"),
          UserInfoListContentEntity(title: "身高", name: "158"),
          UserInfoListContentEntity(title: "喜歡的類型", name: "喜歡男生"),
          UserInfoListContentEntity(title: "手機號碼", name: "0933757612"),
          UserInfoListContentEntity(title: "Email", name: "Yushen@gmail.com"),
        ],
      ),
      UserInfoListEntity(
        name: "工作及教育背景",
        contents: [
          UserInfoListContentEntity(title: "學歷", name: "大學"),
          UserInfoListContentEntity(title: "工作", name: "健身教練"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "游泳", value: "游泳"),
        UserInfoLabelsContentEntity(name: "逛街", value: "逛街"),
        UserInfoLabelsContentEntity(name: "唱歌", value: "唱歌"),
        UserInfoLabelsContentEntity(name: "看電影", value: "看電影"),
      ],
    ),
  ),
  "003": UserInfoEntity(
    id: "003",
    username: "王大黑",
    age: 28,
    city: "新北市",
    description: """
我喜好攝影，放假會到處走走尋找靈感，
不論是拍風景照還是人物照都滿上手的，
但我最喜歡拍的是正在看我個人資料的「妳」
""",
    images: [
      UserInfoImageEntity(id: "02", image: "assets/images/test/users/王大黑.jpeg"),
      UserInfoImageEntity(id: "01", image: "assets/images/splash_3.png"),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "男性"),
          UserInfoListContentEntity(title: "居住地", name: "新北市"),
          UserInfoListContentEntity(title: "身高", name: "183"),
          UserInfoListContentEntity(title: "喜歡的類型", name: "喜歡女生"),
          UserInfoListContentEntity(title: "手機號碼", name: "0989598032"),
          UserInfoListContentEntity(title: "Email", name: "Black@gmail.com"),
        ],
      ),
      UserInfoListEntity(
        name: "工作及教育背景",
        contents: [
          UserInfoListContentEntity(title: "學歷", name: "大學"),
          UserInfoListContentEntity(title: "工作", name: "3C業務"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "攝影", value: "攝影"),
        UserInfoLabelsContentEntity(name: "LOL", value: "LOL"),
        UserInfoLabelsContentEntity(name: "唱歌", value: "唱歌"),
        UserInfoLabelsContentEntity(name: "打籃球", value: "打籃球"),
      ],
    ),
  ),
  "004": UserInfoEntity(
    id: "004",
    username: "江小涵",
    age: 22,
    city: "桃園市",
    description:
        "我的外號是「米奇」，只因為換了去迪士尼戴米老鼠帽子的大頭貼，辦公室同事就幫我取了這個外號，希望可以找到願意讓我帶妳去迪士尼玩的米妮。",
    images: [
      UserInfoImageEntity(id: "02", image: "assets/images/test/users/江小涵.jpeg"),
      UserInfoImageEntity(id: "01", image: "assets/images/splash_3.png"),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "女性"),
          UserInfoListContentEntity(title: "居住地", name: "桃園市"),
          UserInfoListContentEntity(title: "身高", name: "158"),
          UserInfoListContentEntity(title: "喜歡的類型", name: "喜歡男生"),
          UserInfoListContentEntity(title: "手機號碼", name: "0925369520"),
          UserInfoListContentEntity(title: "Email", name: "Xiaohan@gmail.com"),
        ],
      ),
      UserInfoListEntity(
        name: "工作及教育背景",
        contents: [
          UserInfoListContentEntity(title: "學歷", name: "大學"),
          UserInfoListContentEntity(title: "工作", name: "網路行銷"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "逛街", value: "逛街"),
        UserInfoLabelsContentEntity(name: "追劇", value: "追劇"),
        UserInfoLabelsContentEntity(name: "看電影", value: "看電影"),
        UserInfoLabelsContentEntity(name: "甜點", value: "甜點"),
      ],
    ),
  ),
  "005": UserInfoEntity(
    id: "005",
    username: "林大奔",
    age: 24,
    city: "桃園市",
    description:
        "我的外號是「米奇」，只因為換了去迪士尼戴米老鼠帽子的大頭貼，辦公室同事就幫我取了這個外號，希望可以找到願意讓我帶妳去迪士尼玩的米妮。",
    images: [
      UserInfoImageEntity(id: "02", image: "assets/images/test/users/林大奔.jpeg"),
      UserInfoImageEntity(id: "01", image: "assets/images/splash_3.png"),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "男性"),
          UserInfoListContentEntity(title: "居住地", name: "桃園市"),
          UserInfoListContentEntity(title: "身高", name: "177"),
          UserInfoListContentEntity(title: "喜歡的類型", name: "喜歡女生"),
          UserInfoListContentEntity(title: "手機號碼", name: "0978521633"),
          UserInfoListContentEntity(title: "Email", name: "Bang@gmail.com"),
        ],
      ),
      UserInfoListEntity(
        name: "工作及教育背景",
        contents: [
          UserInfoListContentEntity(title: "學歷", name: "大學"),
          UserInfoListContentEntity(title: "工作", name: "汽車美容"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "打籃球", value: "打籃球"),
        UserInfoLabelsContentEntity(name: "PUBG", value: "PUBG"),
        UserInfoLabelsContentEntity(name: "跑山", value: "跑山"),
        UserInfoLabelsContentEntity(name: "街舞", value: "街舞"),
      ],
    ),
  ),
  "006": UserInfoEntity(
    id: "006",
    username: "高偉",
    age: 24,
    city: "新北市",
    description:
        "我的外號是「米奇」，只因為換了去迪士尼戴米老鼠帽子的大頭貼，辦公室同事就幫我取了這個外號，希望可以找到願意讓我帶妳去迪士尼玩的米妮。",
    images: [
      UserInfoImageEntity(id: "02", image: "assets/images/test/users/高偉.jpeg"),
      UserInfoImageEntity(id: "01", image: "assets/images/splash_3.png"),
    ],
    infoList: [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "男性"),
          UserInfoListContentEntity(title: "居住地", name: "新北市"),
          UserInfoListContentEntity(title: "身高", name: "177"),
          UserInfoListContentEntity(title: "喜歡的類型", name: "喜歡女生"),
          UserInfoListContentEntity(title: "手機號碼", name: "0952631799"),
          UserInfoListContentEntity(title: "Email", name: "RWeih@gmail.com"),
        ],
      ),
      UserInfoListEntity(
        name: "工作及教育背景",
        contents: [
          UserInfoListContentEntity(title: "學歷", name: "大學"),
          UserInfoListContentEntity(title: "工作", name: "軟體工程師"),
        ],
      ),
    ],
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
      contents: [
        UserInfoLabelsContentEntity(name: "品茶", value: "品茶"),
        UserInfoLabelsContentEntity(name: "漫畫", value: "漫畫"),
        UserInfoLabelsContentEntity(name: "攝影", value: "攝影"),
        UserInfoLabelsContentEntity(name: "武術", value: "武術"),
      ],
    ),
  ),
};

List<DatingInfoEntity> userSignUpDating = [];

List<DatingInfoEntity> userProcessDating = [];

List<DatingInfoEntity> userHistoryDating = [];

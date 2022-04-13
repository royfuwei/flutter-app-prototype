import 'package:seeks_app_prototype/domain/user.dart';

class UserService {
  Future<UserInfoEntity> getUserInfoById(String id) async {
    return UserInfoEntity(
      id: "01",
      username: "Ray",
      images: [
        UserInfoImageEntity(id: "01"),
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
      ),
    );
  }
}

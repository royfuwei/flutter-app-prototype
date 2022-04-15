import 'package:seeks_app_prototype/domain/user.dart';
part 'data.dart';

class UserService {
  Future<UserInfoEntity> getUserInfoById(String id) async {
    UserInfoEntity userInfo = userInfoMap[id]!;
    return userInfo;
  }

  getUserDatingListById(String id) {
    // return
  }
}

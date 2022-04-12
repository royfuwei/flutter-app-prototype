import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/user.dart';

class UserController extends GetxController {
  UserService userService = UserService();

  String userId = "";

  onInitUserInfo() async {
    userInfo = await userService.getUserInfoById(userId);
  }

  Rx<bool> _isUserInfoOwner = Rx<bool>(true);
  set isUserInfoOwner(value) => _isUserInfoOwner.value = value;
  bool get isUserInfoOwner => _isUserInfoOwner.value;

  Rx<UserInfoEntity> _userInfo = Rx<UserInfoEntity>(UserInfoEntity(
    id: "01",
    habbyLabels: UserInfoLabelsEntity(
      name: "興趣",
    ),
  ));
  set userInfo(value) => _userInfo.value = value;
  UserInfoEntity get userInfo => _userInfo.value;

  Future<void> editorUserInfo() async {
    UserInfoEntity _tempUserInfo = userInfo;
    List<UserInfoListEntity> _temp = [
      UserInfoListEntity(
        name: "詳細個人資料",
        contents: [
          UserInfoListContentEntity(title: "性別", name: "女"),
        ],
      ),
    ];
    _tempUserInfo.infoList = _temp;
    // userInfoList = _temp;
    userInfo = _tempUserInfo;
  }

  floatingActionButtonOnPressed() async {
    print("onPressed userController.editorUserInfo()");
    editorUserInfo();
  }

  @override
  void onInit() async {
    super.onInit();
    await onInitUserInfo();
  }
}

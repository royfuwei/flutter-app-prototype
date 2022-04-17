import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:seeks_app_prototype/core/dating/controllers/dating_info.controller.dart';
import 'package:seeks_app_prototype/core/users/services/user.service.dart';
import 'package:seeks_app_prototype/domain/dating.dart';

class UserDatingController extends GetxController {
  UserService userService = UserService();

  String userId = "";

  Rx<List<DatingInfoEntity>> _userSignUpDating = Rx<List<DatingInfoEntity>>([]);
  set userSignUpDating(List<DatingInfoEntity> value) =>
      _userSignUpDating.value = value;
  List<DatingInfoEntity> get userSignUpDating => _userSignUpDating.value;

  Rx<List<DatingInfoEntity>> _userProcessDating =
      Rx<List<DatingInfoEntity>>([]);
  set userProcessDating(List<DatingInfoEntity> value) =>
      _userProcessDating.value = value;
  List<DatingInfoEntity> get userProcessDating => _userProcessDating.value;

  Rx<List<DatingInfoEntity>> _userHistoryDating =
      Rx<List<DatingInfoEntity>>([]);
  set userHistoryDating(List<DatingInfoEntity> value) =>
      _userHistoryDating.value = value;
  List<DatingInfoEntity> get userHistoryDating => _userHistoryDating.value;

  onInitUserDatingLists() async {
    await refreshUserDatingListById(userId);
  }

  refreshUserDatingListById(String userId) async {
    userHistoryDating = await userService.getUserHistoryDatingList(userId);
    userProcessDating = await userService.getUserProcessDatingList(userId);
    userSignUpDating = await userService.getUserSignUpDatingList(userId);
  }

  onRefreshUserDatingList(RefreshController refreshController) async {
    print("onRefreshUserDatingList");
    await refreshUserDatingListById(userId);
    refreshController.refreshCompleted();
  }

  Future<void> datingInfoOnPressed(DatingInfoEntity item) async {
    DatingInfoController datingInfoController = Get.put(DatingInfoController());
    print("datingItemOnPressed item.id: ${item.id}");
    // datingInfoController.datingId = item.id;
    // toRoutesNamed([MainPage.routeName, DatingInfoPage.routeName]);
    datingInfoController.goPageByDatingId(item.id);
  }

  @override
  void onInit() async {
    userId = await userService.getLoginUserId();
    await onInitUserDatingLists();
    super.onInit();
  }
}

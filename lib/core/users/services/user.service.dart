import 'package:seeks_app_prototype/core/dating/services/dating.service.dart';
import 'package:seeks_app_prototype/domain/dating.dart';
import 'package:seeks_app_prototype/domain/media.dart';
import 'package:seeks_app_prototype/domain/user.dart';
part 'data.dart';

class UserService {
  Future<String> getLoginUserId() async {
    return "000";
  }

  Future<UserInfoEntity> getUserInfoById(String id) async {
    UserInfoEntity result = UserInfoEntity(
      id: "",
      habbyLabels: UserInfoLabelsEntity(
        name: "",
      ),
    );
    bool hasUserId = userInfoMap.keys.toList().indexOf(id) > -1;
    if (hasUserId) {
      result = userInfoMap[id]!;
    }
    return result;
  }

  signUpUser(UserInfoEntity item) async {
    userInfoMap["000"] = item;
  }

  Future<List<DatingInfoEntity>> getUserSignUpDatingList(String id) async {
    List<DatingInfoEntity> results = [];
    datingInfoMap.forEach((key, value) {
      // if (value.userId != id && value.signUpUserIds.indexOf(id) > -1) {
      if (value.userId != id && value.status == DatingStatusType.SIGNUP) {
        results.add(value);
      }
    });
    return results;
  }

  Future<List<DatingInfoEntity>> getUserHistoryDatingList(String id) async {
    List<DatingInfoEntity> results = [];
    datingInfoMap.forEach((key, value) {
      if (value.status == DatingStatusType.FINISH) {
        results.add(value);
      }
    });
    return results;
  }

  Future<List<DatingInfoEntity>> getUserProcessDatingList(String id) async {
    List<DatingInfoEntity> results = [];
    datingInfoMap.forEach((key, value) {
      if (value.userId == id) {
        results.add(value);
      }
    });
    return results;
  }
}

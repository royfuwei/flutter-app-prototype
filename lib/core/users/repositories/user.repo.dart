import 'dart:convert';

import 'package:seeks_app_prototype/core/users/models/user_create_model.dart';
import 'package:seeks_app_prototype/core/users/models/user_status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  static String userStatuStoredKey = 'UserStatusModel';
  static String userCreateStoredKey = 'UserCreateModel';

  /* UserStatusModel */

  Future<UserStatusModel> getUserStatusModel() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(userStatuStoredKey) ?? null;
    UserStatusModel model = new UserStatusModel();
    if (value != null) {
      var modelJson = jsonDecode(value);
      model = UserStatusModel.fromJson(modelJson);
    }
    return model;
  }

  Future<void> setUserStatusModel(Map<String, dynamic> json) async {
    var model = UserStatusModel.fromJson(json);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jsonStr = jsonEncode(model.toJson());
    await pref.setString(userStatuStoredKey, jsonStr);
  }

  Future<void> clearUserStatusModel() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(userStatuStoredKey);
  }

  /* UserCreateModel */

  Future<UserCreateModel> getUserCreateModel() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(userCreateStoredKey) ?? null;
    UserCreateModel model = new UserCreateModel();
    if (value != null) {
      var modelJson = jsonDecode(value);
      model = UserCreateModel.fromJson(modelJson);
    }
    return model;
  }

  Future<void> setUserCreateModel(Map<String, dynamic> json) async {
    var model = UserCreateModel.fromJson(json);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jsonStr = jsonEncode(model.toJson());
    await pref.setString(userCreateStoredKey, jsonStr);
  }

  Future<void> clearUserCreateModel() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(userCreateStoredKey);
  }

  Future<UserCreateModel> setValue(String key, value) async {
    var model = await getUserCreateModel();
    var json = model.toJson();
    json[key] = value;
    await setUserCreateModel(json);
    return await getUserCreateModel();
  }
}

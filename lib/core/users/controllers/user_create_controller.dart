import 'dart:convert';

import 'package:get/get.dart';
import 'package:seeks_flutter/core/users/models/user_create_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCreateController extends GetxController {
  final userCreateModel = UserCreateModel().obs;
  static String storedKey = 'UserCreateModel';

  Future<UserCreateModel> getLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(storedKey) ?? null;
    UserCreateModel model = new UserCreateModel();
    if (value != null) {
      var modelJson = jsonDecode(value);
      model = UserCreateModel.fromJson(modelJson);
    }
    return model;
  }

  Future<void> setLocalStorage(Map<String, dynamic> json) async {
    var model = UserCreateModel.fromJson(json);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jsonStr = jsonEncode(model.toJson());
    await pref.setString(storedKey, jsonStr);
  }

  Future<void> clearLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(storedKey);
  }

  Future<UserCreateModel> setValue(String key, value) async {
    var model = await getLocalStorage();
    var json = model.toJson();
    json[key] = value;
    await setLocalStorage(json);
    return await getLocalStorage();
  }
}

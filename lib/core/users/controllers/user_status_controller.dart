import 'dart:convert';

import 'package:get/get.dart';
import 'package:seeks_flutter/core/users/models/user_status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserStatusController extends GetxController {
  final userStatusModel = UserStatusModel().obs;
  static String storedKey = 'UserStatusModel';

  Future<UserStatusModel> getLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(storedKey) ?? null;
    UserStatusModel model = new UserStatusModel();
    if (value != null) {
      var modelJson = jsonDecode(value);
      model = UserStatusModel.fromJson(modelJson);
    }
    return model;
  }

  Future<void> setLocalStorage(Map<String, dynamic> json) async {
    var model = UserStatusModel.fromJson(json);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jsonStr = jsonEncode(model.toJson());
    await pref.setString(storedKey, jsonStr);
  }

  Future<void> clearLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(storedKey);
  }
}

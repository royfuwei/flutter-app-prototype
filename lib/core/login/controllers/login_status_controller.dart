import 'dart:convert';

import 'package:get/get.dart';
import 'package:seeks_flutter/core/login/models/login_status_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginStatusController extends GetxController {
  final loginStatusModel = LoginStatusModel().obs;
  static String storedKey = 'LoginStatusModel';

  Future<LoginStatusModel> getLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(storedKey) ?? null;
    LoginStatusModel model = new LoginStatusModel();
    if (value != null) {
      var modelJson = jsonDecode(value);
      model = LoginStatusModel.fromJson(modelJson);
    }
    return model;
  }

  Future<void> setLocalStorage(Map<String, dynamic> json) async {
    var model = LoginStatusModel.fromJson(json);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jsonStr = jsonEncode(model.toJson());
    await pref.setString(storedKey, jsonStr);
  }

  Future<void> clearLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(storedKey);
  }

  Future<LoginStatusModel> setValue(String key, value) async {
    var model = await getLocalStorage();
    var json = model.toJson();
    json[key] = value;
    await setLocalStorage(json);
    return await getLocalStorage();
  }
}

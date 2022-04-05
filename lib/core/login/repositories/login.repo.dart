import 'dart:convert';

import 'package:seeks_app_prototype/core/login/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginRepository {
  static String storedKey = 'LoginRepository';

  Future<LoginModel> getLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var value = pref.getString(storedKey) ?? null;
    LoginModel model = new LoginModel();
    if (value != null) {
      var modelJson = jsonDecode(value);
      model = LoginModel.fromJson(modelJson);
    }
    return model;
  }

  Future<void> setLocalStorage(Map<String, dynamic> json) async {
    var model = LoginModel.fromJson(json);
    SharedPreferences pref = await SharedPreferences.getInstance();
    var jsonStr = jsonEncode(model.toJson());
    await pref.setString(storedKey, jsonStr);
  }

  Future<void> clearLocalStorage() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(storedKey);
  }

  Future<LoginModel> setValue(String key, value) async {
    var model = await getLocalStorage();
    var json = model.toJson();
    json[key] = value;
    await setLocalStorage(json);
    return await getLocalStorage();
  }
}

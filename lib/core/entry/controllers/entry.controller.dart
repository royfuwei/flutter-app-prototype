import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/login/controllers/login_controller.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';
import 'package:seeks_app_prototype/core/login/repositories/login.repo.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class EntryController extends GetxController {
// class EntryController extends LoginController {
  final loginRepo = new LoginRepository();

  bodyAnimatedOnEnd() async {
    await this._userStatusGoPage();
  }

  Future<void> _userStatusGoPage() async {
    var loginModel = await loginRepo.getLocalStorage();
    if (loginModel.isLogin) {
      offAllRoutesNamed([MainPage.routeName]);
    } else {
      offAllRoutesNamed([EntryPage.routeName, LoginPage.routeName]);
    }
  }
}

import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/login/repositories/login.repo.dart';

class InitController extends GetxController {
  final loginRepo = new LoginRepository();

  initIsLoginStatus() async {
    var thisLoginModel = await loginRepo.getLocalStorage();
    print("[InitController] thisLoginModel.isLogin: ${thisLoginModel.isLogin}");
    // isLogin = thisLoginModel.isLogin;
  }

  @override
  void onInit() {
    loginRepo.clearLocalStorage();
    initIsLoginStatus();
    super.onInit();
  }
}

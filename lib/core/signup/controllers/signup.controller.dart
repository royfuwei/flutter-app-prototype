import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/location/pages/location_open.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class SignUpController extends GetxController {
  final _signUpAccountGoNext = false.obs;
  set signUpAccountGoNext(value) => this._signUpAccountGoNext.value = value;
  get signUpAccountGoNext => this._signUpAccountGoNext.value;

  final _email = ''.obs;
  set email(value) => this._email.value = value;
  get email => this._email.value;

  final _referralCode = ''.obs;
  set referralCode(value) => this._referralCode.value = value;
  get referralCode => this._referralCode.value;

  final _telephone = ''.obs;
  set telephone(value) => this._telephone.value = value;
  get telephone => this._telephone.value;

  // api 檢查email 是否已被使用
  signUpAccountGoNextOnPressed() async {
    toRoutesNamed([
      EntryPage.routeName,
      LocationOpenPage.routeName,
    ]);
  }

  // 檢查email 格式
  signUpAccountFieldEmailOnChanged(String text) async {
    if (text.isNotEmpty) {
      email = text;
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
      signUpAccountGoNext = emailValid;
    }
  }

  signUpAccountFieldReferralCodeOnChanged(String text) async {}
}

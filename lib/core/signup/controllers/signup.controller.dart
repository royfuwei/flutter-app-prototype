import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload.page.dart';
import 'package:seeks_app_prototype/core/location/controllers/location.controller.dart';
import 'package:seeks_app_prototype/core/notification/controllers/notification.controller.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_location.page.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_push_notification.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class SignUpController extends GetxController {
  LocationController locationController = Get.put(LocationController());
  NotificationController notificationController =
      Get.put(NotificationController());

  final _email = ''.obs;
  set email(value) => this._email.value = value;
  get email => this._email.value;

  final _referralCode = ''.obs;
  set referralCode(value) => this._referralCode.value = value;
  get referralCode => this._referralCode.value;

  final _telephone = ''.obs;
  set telephone(value) => this._telephone.value = value;
  get telephone => this._telephone.value;

  @override
  void onInit() {
    // onInitSignUpLocationSetting();
    // onInitSignUpNotificationSetting();
    super.onInit();
  }

  // sign up account
  final _signUpAccountGoNext = false.obs;
  set signUpAccountGoNext(value) => this._signUpAccountGoNext.value = value;
  get signUpAccountGoNext => this._signUpAccountGoNext.value;

  // api 檢查email 是否已被使用
  signUpAccountGoNextOnPressed() async {
    onInitSignUpLocationSetting();
    toRoutesNamed([
      EntryPage.routeName,
      SignUpLocationPage.routeName,
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

  // sign up location
  final _signUpLocationGoNext = false.obs;
  set signUpLocationGoNext(value) => this._signUpLocationGoNext.value = value;
  bool get signUpLocationGoNext => this._signUpLocationGoNext.value;

  final _signUpLocationSettingPermission = true.obs;
  set signUpLocationSettingPermission(value) =>
      this._signUpLocationSettingPermission.value = value;
  bool get signUpLocationSettingPermission =>
      this._signUpLocationSettingPermission.value;

  final _signUpLocationPermissionTitle = '開啟定位'.obs;
  set signUpLocationPermissionTitle(value) =>
      this._signUpLocationPermissionTitle.value = value;
  String get signUpLocationPermissionTitle =>
      this._signUpLocationPermissionTitle.value;

  Future<void> onInitSignUpLocationSetting() async {
    await _signUpLocationSettingPermissionByPermission();
  }

  Future<void> _signUpLocationSettingPermissionByPermission() async {
    var locationPermission = await locationController.checkPermission();
    print(
        "[SignUpController] _signUpLocationSettingPermissionByPermission locationPermission: ${locationPermission}");

    switch (locationPermission) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        signUpLocationPermissionTitle = '開啟定位(${locationPermission.name})';
        signUpLocationGoNext = false;
        signUpLocationSettingPermission = true;
        break;
      default:
        signUpLocationPermissionTitle = '已開啟定位(${locationPermission.name})';
        signUpLocationGoNext = true;
        signUpLocationSettingPermission = false;
        break;
    }
  }

  Future<void> signUpLocationGoNextOnPressed() async {
    onInitSignUpNotificationSetting();
    toRoutesNamed([
      EntryPage.routeName,
      SignUpPushNotificationPage.routeName,
    ]);
  }

  Future<void> signUpLocationPermissionOnPressed() async {
    await locationController.getPermission();
    await _signUpLocationSettingPermissionByPermission();
  }

  // sign up notification
  final _signUpNotificationGoNext = false.obs;
  set signUpNotificationGoNext(value) =>
      this._signUpNotificationGoNext.value = value;
  bool get signUpNotificationGoNext => this._signUpNotificationGoNext.value;

  final _signUpNotificationSettingPermission = true.obs;
  set signUpNotificationSettingPermission(value) =>
      this._signUpNotificationSettingPermission.value = value;
  bool get signUpNotificationSettingPermission =>
      this._signUpNotificationSettingPermission.value;

  final _signUpNotificationPermissionTitle = '開啟通知'.obs;
  set signUpNotificationPermissionTitle(value) =>
      this._signUpNotificationPermissionTitle.value = value;
  String get signUpNotificationPermissionTitle =>
      this._signUpNotificationPermissionTitle.value;

  Future<void> _signUpNotificationSettingPermissionByPermission() async {
    var permission = await notificationController.checkPermission();
    print(
        "[SignUpController] signUpNotificationSettingPermissionByPermission permission: ${permission}");
    switch (permission) {
      case PermissionStatus.unknown:
        signUpNotificationPermissionTitle = '開啟通知(${permission.name})';
        signUpNotificationGoNext = false;
        signUpNotificationSettingPermission = true;
        break;
      case PermissionStatus.denied:
        signUpNotificationPermissionTitle = '已停用通知(${permission.name})';
        signUpNotificationGoNext = true;
        signUpNotificationSettingPermission = true;
        break;
      default:
        signUpNotificationPermissionTitle = '已開啟通知(${permission.name})';
        signUpNotificationGoNext = true;
        signUpNotificationSettingPermission = false;
        break;
    }
  }

  Future<void> signUpNotificationGoNextOnPressed() async {
    toRoutesNamed([
      EntryPage.routeName,
      ImageUploadPage.routeName,
    ]);
  }

  Future<void> signUpNotificationPermissionOnPressed() async {
    await notificationController.getPermission();
    await _signUpNotificationSettingPermissionByPermission();
  }

  Future<void> onInitSignUpNotificationSetting() async {
    await _signUpNotificationSettingPermissionByPermission();
  }
}

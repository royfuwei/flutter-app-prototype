import 'package:get/get.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/notification/controllers/notification.controller.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_images_upload.page.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_user_info.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class SignUpPushNotificationController extends GetxController {
  NotificationController notificationController =
      Get.put(NotificationController());

  @override
  void onInit() {
    // onInitSignUpLocationSetting();
    onInitSignUpNotificationSetting();
    super.onInit();
  }

  // sign up notification
  final _goNext = false.obs;
  set goNext(value) => this._goNext.value = value;
  bool get goNext => this._goNext.value;

  final _notificationSettingPermission = true.obs;
  set notificationSettingPermission(value) =>
      this._notificationSettingPermission.value = value;
  bool get notificationSettingPermission =>
      this._notificationSettingPermission.value;

  final _notificationPermissionTitle = '開啟通知'.obs;
  set notificationPermissionTitle(value) =>
      this._notificationPermissionTitle.value = value;
  String get notificationPermissionTitle =>
      this._notificationPermissionTitle.value;

  Future<void> _notificationSettingPermissionByPermission() async {
    var permission = await notificationController.checkPermission();
    print(
        "[SignUpController] notificationSettingPermissionByPermission permission: ${permission}");
    switch (permission) {
      case PermissionStatus.unknown:
        notificationPermissionTitle = '開啟通知(${permission.name})';
        goNext = false;
        notificationSettingPermission = true;
        break;
      case PermissionStatus.denied:
        notificationPermissionTitle = '已停用通知(${permission.name})';
        goNext = true;
        notificationSettingPermission = true;
        break;
      default:
        notificationPermissionTitle = '已開啟通知(${permission.name})';
        goNext = true;
        notificationSettingPermission = false;
        break;
    }
  }

  Future<void> goNextOnPressed() async {
    toRoutesNamed([
      EntryPage.routeName,
      SignUpImagesUpload.routeName,
    ]);
  }

  Future<void> notificationPermissionOnPressed() async {
    await notificationController.getPermission();
    await _notificationSettingPermissionByPermission();
  }

  Future<void> onInitSignUpNotificationSetting() async {
    await _notificationSettingPermissionByPermission();
  }
}

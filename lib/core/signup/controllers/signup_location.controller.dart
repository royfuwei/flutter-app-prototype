import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/location/services/location.service.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_push_notification.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class SignUpLocationController extends GetxController {
  LocationService locationService = LocationService();

  @override
  void onInit() {
    onInitLocationSetting();
    super.onInit();
  }

  // sign up location
  final _goNext = false.obs;
  set goNext(value) => this._goNext.value = value;
  bool get goNext => this._goNext.value;

  final _locationSettingPermission = true.obs;
  set locationSettingPermission(value) =>
      this._locationSettingPermission.value = value;
  bool get locationSettingPermission => this._locationSettingPermission.value;

  final _locationPermissionTitle = '開啟定位'.obs;
  set locationPermissionTitle(value) =>
      this._locationPermissionTitle.value = value;
  String get locationPermissionTitle => this._locationPermissionTitle.value;

  Future<void> onInitLocationSetting() async {
    await _locationSettingPermissionByPermission();
  }

  Future<void> _locationSettingPermissionByPermission() async {
    var locationPermission = await locationService.checkPermission();
    print(
      "[SignUpController] _LocationSettingPermissionByPermission locationPermission: ${locationPermission}",
    );

    switch (locationPermission) {
      case LocationPermission.denied:
      case LocationPermission.deniedForever:
        locationPermissionTitle = '開啟定位(${locationPermission.name})';
        goNext = false;
        locationSettingPermission = true;
        break;
      default:
        locationPermissionTitle = '已開啟定位(${locationPermission.name})';
        goNext = true;
        locationSettingPermission = false;
        break;
    }
  }

  Future<void> goNextOnPressed() async {
    // onInitSignUpNotificationSetting();
    toRoutesNamed([
      EntryPage.routeName,
      SignUpPushNotificationPage.routeName,
    ]);
  }

  Future<void> locationPermissionOnPressed() async {
    await locationService.getPermission();
    await _locationSettingPermissionByPermission();
  }
}

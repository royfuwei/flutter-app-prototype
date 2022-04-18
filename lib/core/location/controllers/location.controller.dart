import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/location/services/location.service.dart';

class LocationController extends GetxController {
  /* final Rx<Permission> _Permission =
      Rx<Permission>(Permission.denied);
  set Permission(value) => this._Permission.value = value;
  Permission get Permission => this._Permission.value; */
  LocationService locationService = LocationService();

  @override
  void onInit() async {
    await locationService.checkPermission();
    super.onInit();
  }
}

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  /* final Rx<Permission> _Permission =
      Rx<Permission>(Permission.denied);
  set Permission(value) => this._Permission.value = value;
  Permission get Permission => this._Permission.value; */

  Future<LocationPermission> checkPermission() async {
    var permission = await Geolocator.checkPermission();
    print(
      "[LocationController] checkPermission Permission: ${permission}",
    );
    return permission;
  }

  Future<LocationPermission> getPermission() async {
    var permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openLocationSettings();
      await getPermission();
    }
    print("[LocationController] getPermission Permission: ${permission}");
    return permission;
  }

  @override
  void onInit() async {
    await checkPermission();
    super.onInit();
  }
}

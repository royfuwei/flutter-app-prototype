import 'package:geolocator/geolocator.dart';

class LocationService {
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
}

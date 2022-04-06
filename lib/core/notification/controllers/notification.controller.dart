import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:notification_permissions/notification_permissions.dart';

class NotificationController extends GetxController {
  Future<PermissionStatus> checkPermission() async {
    var permission =
        await NotificationPermissions.getNotificationPermissionStatus();
    print(
      "[NotificationController] checkPermission permission: ${permission}",
    );
    return permission;
  }

  Future<PermissionStatus> getPermission() async {
    var permission =
        await NotificationPermissions.getNotificationPermissionStatus();
    print(
        "[NotificationController] getPermission getNotificationPermissionStatus: ${permission}");
    switch (permission) {
      case PermissionStatus.unknown:
        permission =
            await NotificationPermissions.requestNotificationPermissions();
        break;
      case PermissionStatus.denied:
        await Geolocator.openAppSettings();
        await getPermission();

        break;
      default:
        break;
    }
    return permission;
  }
}

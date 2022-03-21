import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dev/pages/default_page.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_alert.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_api_get.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_api_post.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_biometric.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_buttom_navigation_tarbar.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_custom_scroll_view.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_firebase.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_geolocator.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_getx.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_google_map.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_inherited_widget.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_life_cycle.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_listview_chat.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_listview_checkbox.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_listview_msg.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_listview_refresh.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_listview_slidable.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_listview_stickyHeader.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_local_storage.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_notification.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_path_provider.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_photo_manager.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_photo_manager_v2.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_photo_manager_v3.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_picker.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_carousel_silder.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_image_cropper.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_image_picker.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_image_ig_picker.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_image_pickers.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_provider.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_provider2.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_shared_preference.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_sqflite.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_url_launcher.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_webview.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_widget_key.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_widget_key_change.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_widget_key_change_less.dart';
import 'package:seeks_app_prototype/infrastructures/develop/pages/develop.page.dart';
import 'package:seeks_app_prototype/routes/app_pages.dart';
import 'package:seeks_app_prototype/routes/devPagesBind.dart';
// import 'infrastructures/develop/screens/develop_screens.dart';

part 'dev_routes.dart';

class DevPages {
  static String initPage = DevEntryPage.routeName;
  static final routes = [
    ...DevRoutes.mainRoutes,
    ...AppRoutes.entryRoutes,
    ...AppRoutes.mainRoutes,
  ];
}

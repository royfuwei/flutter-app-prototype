import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/captcha/pages/captcha.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_info.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add.page.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/forgot_password/pages/forgot_password.page.dart';
import 'package:seeks_app_prototype/core/home/pages/home.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_picker.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload_notify.page.dart';
import 'package:seeks_app_prototype/core/location/pages/location_open.page.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat_list.page.dart';
import 'package:seeks_app_prototype/core/more/pages/more.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notfication.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notification_open.page.dart';
import 'package:seeks_app_prototype/core/splash/pages/splash.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_create_info.page.dart';
import 'package:seeks_app_prototype/core/login/pages/login_splash.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_create.page.dart';
import 'package:seeks_app_prototype/routes/appPagesBind.dart';
// import 'infrastructures/develop/pages/develop_screens.dart';
part 'app_routes.dart';

class AppPages {
  static String initPage = EntryPage.routeName;
  static final routes = [
    ...AppRoutes.entryRoutes,
    ...AppRoutes.mainRoutes,
  ];
}

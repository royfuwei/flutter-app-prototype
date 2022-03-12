import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/captcha/screens/captcha_screen.dart';
import 'package:seeks_app_prototype/core/dating/screens/dating_add_screen.dart';
import 'package:seeks_app_prototype/core/entry/screens/entry_screen.dart';
import 'package:seeks_app_prototype/core/forgot_password/screens/forgot_password_screen.dart';
import 'package:seeks_app_prototype/core/home/screens/home_screen.dart';
import 'package:seeks_app_prototype/core/image/screens/image_picker.dart';
import 'package:seeks_app_prototype/core/image/screens/image_upload.dart';
import 'package:seeks_app_prototype/core/location/screens/location_open_screen.dart';
import 'package:seeks_app_prototype/core/login/screens/login_screen.dart';
import 'package:seeks_app_prototype/core/main/screens/main_screen.dart';
import 'package:seeks_app_prototype/core/chat/screens/chat_list_screen.dart';
import 'package:seeks_app_prototype/core/media/components/media_asset_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_album_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';
import 'package:seeks_app_prototype/core/more/screens/more_screen.dart';
import 'package:seeks_app_prototype/core/notification/screens/notfication_screen.dart';
import 'package:seeks_app_prototype/core/notification/screens/notification_open_screen.dart';
import 'package:seeks_app_prototype/core/splash/screens/splash_screen.dart';
import 'package:seeks_app_prototype/core/test/screens/default_page.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_alert.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_api_get.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_api_post.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_buttom_navigation_tarbar.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_custom_scroll_view.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_getx.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_inherited_widget.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_life_cycle.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_listview_chat.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_listview_checkbox.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_listview_msg.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_listview_refresh.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_listview_slidable.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_listview_stickyHeader.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_local_storage.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_notification.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_path_provider.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_photo_manager.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_photo_manager_v2.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_photo_manager_v3.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_picker.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_carousel_silder.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_image_cropper.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_image_picker.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_image_ig_picker.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_image_pickers.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_provider.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_shared_preference.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_sqflite.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_widget_key.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_widget_key_change.dart';
import 'package:seeks_app_prototype/core/test/screens/dev_widget_key_change_less.dart';
import 'package:seeks_app_prototype/core/users/screens/user_create_info_screen.dart';
import 'package:seeks_app_prototype/core/users/screens/user_create_screen.dart';

import 'core/login/screens/login_splash_screen.dart';
import 'infrastructures/develop/screens/develop_screens.dart';

class DevRoutes {
  static final home = '/';
  static final defaultPage = '/default';
  static final firstPage = '/first_page';
  static final testBottomNav = '/test_bottom_nav';
}

late String title;
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  EntryScreen.routeName: (context) => EntryScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  LoginSplashScreen.routeName: (context) => LoginSplashScreen(),
  UserCreateScreen.routeName: (context) => UserCreateScreen(),
  LocationOpenScreen.routeName: (context) => LocationOpenScreen(),
  NotificationOpenScreen.routeName: (context) => NotificationOpenScreen(),
  ImageUploadScreen.routeName: (context) => ImageUploadScreen(),
  ImagePickerScreen.routeName: (context) => ImagePickerScreen(),
  UserCreateInfoScreen.routeName: (context) => UserCreateInfoScreen(),
  CaptchaScreen.routeName: (context) => CaptchaScreen(),
  MainScreen.routeName: (context) => MainScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  NotificationScreen.routeName: (context) => NotificationScreen(),
  ChatListScreen.routeName: (context) => ChatListScreen(),
  DatingAddScreen.routeName: (context) => DatingAddScreen(),
  MoreScreen.routeName: (context) => MoreScreen(),
  DevImagePicker.routeName: (context) => DevImagePicker(),
  DevImagePickers.routeName: (context) => DevImagePickers(),
  DevImageIGPicker.routeName: (context) => DevImageIGPicker(),
  DevImageCropper.routeName: (context) => DevImageCropper(),
  DevCarouselSlider.routeName: (context) => DevCarouselSlider(),
  DevPicker.routeName: (context) => DevPicker(),
  DevAlert.routeName: (context) => DevAlert(),
  DevListViewMsg.routeName: (context) => DevListViewMsg(),
  DevListViewRefresh.routeName: (context) => DevListViewRefresh(),
  DevListViewStickyHeader.routeName: (context) => DevListViewStickyHeader(),
  DevListViewSlidable.routeName: (context) => DevListViewSlidable(),
  DevListViewCheckbox.routeName: (context) => DevListViewCheckbox(),
  DevSharedPreference.routeName: (context) => DevSharedPreference(),
  DevCustomScrollView.routeName: (context) => DevCustomScrollView(),
  DevBottomNavigationTabBar.routeName: (context) => DevBottomNavigationTabBar(),
  DevProvider.routeName: (context) => DevProvider(),
  DevApiGet.routeName: (context) => DevApiGet(),
  DevApiPost.routeName: (context) => DevApiPost(),
  DevPathProvider.routeName: (context) => DevPathProvider(),
  DevLifeCycle.routeName: (context) => DevLifeCycle(),
  DevInheritedWidget.routeName: (context) => DevInheritedWidget(),
  DevNotification.routeName: (context) => DevNotification(),
  DevLocalStorage.routeName: (context) => DevLocalStorage(),
  DevGetX.routeName: (context) => DevGetX(),
  DevPhotoManager.routeName: (context) => DevPhotoManager(),
  DevPhotoManagerV2.routeName: (context) => DevPhotoManagerV2(),
  DevPhotoManagerV3.routeName: (context) => DevPhotoManagerV3(),
  DevSqflite.routeName: (context) => DevSqflite(),
  DevListViewChat.routeName: (context) => DevListViewChat(),
  DevRoutes.defaultPage: (BuildContext context) {
    dynamic obj = ModalRoute.of(context)!.settings.arguments;
    print('obj: $obj');
    print('value: $context');
    title = obj["title"]; // 把接收到的參數存到變數
    return new DefaultPage(title: title);
  },
  DevEntryPage.routeName: (context) => DevEntryPage(),
  LoginScreen.routeName: (context) => new LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => new ForgotPasswordScreen(),
  MediaAssetSelector.routeName: (context) => new MediaAssetSelector(),
  MediaAlbumSelector.routeName: (context) => new MediaAlbumSelector(),
  MediaGridSelector.routeName: (context) => new MediaGridSelector(),
  MediaGridSelectorCrop.routeName: (context) => new MediaGridSelectorCrop(),
  DevWidgetKey.routeName: (context) => new DevWidgetKey(),
  DevWidgetKeyChange.routeName: (context) => new DevWidgetKeyChange(),
  DevWidgetKeyChangeLess.routeName: (context) => new DevWidgetKeyChangeLess(),
};

void routePushNamed(BuildContext context, String route, {Object? arguments}) {
  Navigator.of(context).pushNamed(
    route,
    arguments: arguments,
  );
}

void routePushNamedAndRemoveUntil(BuildContext context, String route,
    {Object? arguments}) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    route,
    (route) => false,
    arguments: arguments,
  );
}

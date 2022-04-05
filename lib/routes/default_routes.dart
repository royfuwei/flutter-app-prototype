import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel_captcha.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_images.page.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/forgot_password/pages/forgot_password.page.dart';
import 'package:seeks_app_prototype/core/home/pages/home.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload_notify.page.dart';
import 'package:seeks_app_prototype/core/location/pages/location_open.page.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat_list.page.dart';
import 'package:seeks_app_prototype/core/media/components/media_asset_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_album_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';
import 'package:seeks_app_prototype/core/more/pages/more.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notfication.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notification_open.page.dart';
import 'package:seeks_app_prototype/core/splash/pages/splash.page.dart';
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
import 'package:seeks_app_prototype/core/users/pages/user_create_info.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_create.page.dart';

import '../core/login/pages/login_tel.page.dart';
import '../infrastructures/develop/pages/develop.page.dart';

class DevRoutes {
  static final home = '/';
  static final defaultPage = '/default';
  static final firstPage = '/first_page';
  static final testBottomNav = '/test_bottom_nav';
}

late String title;
final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  EntryPage.routeName: (context) => EntryPage(),
  LoginPage.routeName: (context) => LoginPage(),
  LoginTelPage.routeName: (context) => LoginTelPage(),
  UserCreatePage.routeName: (context) => UserCreatePage(),
  LocationOpenPage.routeName: (context) => LocationOpenPage(),
  NotificationOpenPage.routeName: (context) => NotificationOpenPage(),
  ImageUploadPage.routeName: (context) => ImageUploadPage(),
  UserCreateInfoPage.routeName: (context) => UserCreateInfoPage(),
  LoginTelCaptchaPage.routeName: (context) => LoginTelCaptchaPage(),
  MainPage.routeName: (context) => MainPage(),
  HomePage.routeName: (context) => HomePage(),
  NotificationPage.routeName: (context) => NotificationPage(),
  ChatListPage.routeName: (context) => ChatListPage(),
  DatingAddImagesPage.routeName: (context) => DatingAddImagesPage(),
  MorePage.routeName: (context) => MorePage(),
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
  DefaultPage.routeName: (BuildContext context) {
    dynamic obj = ModalRoute.of(context)!.settings.arguments;
    print('obj: $obj');
    print('value: $context');
    title = obj["title"]; // 把接收到的參數存到變數
    return new DefaultPage(title: title);
  },
  DevEntryPage.routeName: (context) => DevEntryPage(),
  LoginPage.routeName: (context) => new LoginPage(),
  ForgotPasswordPage.routeName: (context) => new ForgotPasswordPage(),
  MediaAssetSelector.routeName: (context) => new MediaAssetSelector(),
  MediaAlbumSelector.routeName: (context) => new MediaAlbumSelector(),
  MediaGridSelector.routeName: (context) => new MediaGridSelector(),
  MediaGridSelectorCrop.routeName: (context) => new MediaGridSelectorCrop(),
  DevWidgetKey.routeName: (context) => new DevWidgetKey(),
  DevWidgetKeyChange.routeName: (context) => new DevWidgetKeyChange(),
  DevWidgetKeyChangeLess.routeName: (context) => new DevWidgetKeyChangeLess(),
  ImageSelectorPage.routeName: (context) => new ImageSelectorPage(),
  DevUrlLauncher.routeName: (context) => new DevUrlLauncher(),
  DevWebView.routeName: (context) => new DevWebView(),
  DevBiometric.routeName: (context) => new DevBiometric(),
  DevGeoLocator.routeName: (context) => new DevGeoLocator(),
  DevGoogleMap.routeName: (context) => new DevGoogleMap(),
  DevFirebaseFCM.routeName: (context) => new DevFirebaseFCM(),
  DevProvider2.routeName: (context) => new DevProvider2(),
  ImageUploadNotifyPage.routeName: (context) => new ImageUploadNotifyPage(),
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

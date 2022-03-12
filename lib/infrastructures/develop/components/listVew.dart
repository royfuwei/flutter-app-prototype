import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/captcha/screens/captcha_screen.dart';
import 'package:seeks_app_prototype/core/dating/screens/dating_add_screen.dart';
import 'package:seeks_app_prototype/core/entry/screens/entry_screen.dart';
import 'package:seeks_app_prototype/core/home/screens/home_screen.dart';
import 'package:seeks_app_prototype/core/image/screens/image_picker.dart';
import 'package:seeks_app_prototype/core/image/screens/image_upload.dart';
import 'package:seeks_app_prototype/core/location/screens/location_open_screen.dart';
import 'package:seeks_app_prototype/core/login/screens/login_screen.dart';
import 'package:seeks_app_prototype/core/login/screens/login_splash_screen.dart';
import 'package:seeks_app_prototype/core/main/screens/main_screen.dart';
import 'package:seeks_app_prototype/core/chat/screens/chat_list_screen.dart';
import 'package:seeks_app_prototype/core/media/components/media_asset_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_album_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';
import 'package:seeks_app_prototype/core/more/screens/more_screen.dart';
import 'package:seeks_app_prototype/core/notification/screens/notfication_screen.dart';
import 'package:seeks_app_prototype/core/notification/screens/notification_open_screen.dart';
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
import 'package:seeks_app_prototype/routes.dart';

List<Widget> getTestView(BuildContext context) {
  return <Widget>[
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text('default'),
      onTap: () {
        routePushNamed(context, DevRoutes.defaultPage,
            arguments: {'title': 'Flutter Default Page'});
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevImagePicker.routeName),
      onTap: () {
        routePushNamed(context, DevImagePicker.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevImagePickers.routeName),
      onTap: () {
        routePushNamed(context, DevImagePickers.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevImageIGPicker.routeName),
      onTap: () {
        routePushNamed(context, DevImageIGPicker.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevImageCropper.routeName),
      onTap: () {
        routePushNamed(context, DevImageCropper.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevCarouselSlider.routeName),
      onTap: () {
        routePushNamed(context, DevCarouselSlider.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPicker.routeName),
      onTap: () {
        routePushNamed(context, DevPicker.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevAlert.routeName),
      onTap: () {
        routePushNamed(context, DevAlert.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewMsg.routeName),
      onTap: () {
        routePushNamed(context, DevListViewMsg.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewRefresh.routeName),
      onTap: () {
        routePushNamed(context, DevListViewRefresh.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewStickyHeader.routeName),
      onTap: () {
        routePushNamed(context, DevListViewStickyHeader.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewSlidable.routeName),
      onTap: () {
        routePushNamed(context, DevListViewSlidable.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewCheckbox.routeName),
      onTap: () {
        routePushNamed(context, DevListViewCheckbox.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevSharedPreference.routeName),
      onTap: () {
        routePushNamed(context, DevSharedPreference.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevCustomScrollView.routeName),
      onTap: () {
        routePushNamed(context, DevCustomScrollView.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevBottomNavigationTabBar.routeName),
      onTap: () {
        routePushNamed(context, DevBottomNavigationTabBar.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevProvider.routeName),
      onTap: () {
        routePushNamed(context, DevProvider.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevApiGet.routeName),
      onTap: () {
        routePushNamed(context, DevApiGet.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevApiPost.routeName),
      onTap: () {
        routePushNamed(context, DevApiPost.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPathProvider.routeName),
      onTap: () {
        routePushNamed(context, DevPathProvider.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevLifeCycle.routeName),
      onTap: () {
        routePushNamed(context, DevLifeCycle.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevInheritedWidget.routeName),
      onTap: () {
        routePushNamed(context, DevInheritedWidget.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevNotification.routeName),
      onTap: () {
        routePushNamed(context, DevNotification.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevLocalStorage.routeName),
      onTap: () {
        routePushNamed(context, DevLocalStorage.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevGetX.routeName),
      onTap: () {
        routePushNamed(context, DevGetX.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPhotoManager.routeName),
      onTap: () {
        routePushNamed(context, DevPhotoManager.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPhotoManagerV2.routeName),
      onTap: () {
        routePushNamed(context, DevPhotoManagerV2.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPhotoManagerV3.routeName),
      onTap: () {
        routePushNamed(context, DevPhotoManagerV3.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevSqflite.routeName),
      onTap: () {
        routePushNamed(context, DevSqflite.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewChat.routeName),
      onTap: () {
        routePushNamed(context, DevListViewChat.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevWidgetKey.routeName),
      onTap: () {
        routePushNamed(context, DevWidgetKey.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevWidgetKeyChange.routeName),
      onTap: () {
        routePushNamed(context, DevWidgetKeyChange.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevWidgetKeyChangeLess.routeName),
      onTap: () {
        routePushNamed(context, DevWidgetKeyChangeLess.routeName);
      },
    ),
  ];
}

List<Widget> getDevView(BuildContext context) {
  return <Widget>[
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(EntryScreen.routeName),
      onTap: () {
        routePushNamed(context, EntryScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LoginScreen.routeName),
      onTap: () {
        routePushNamed(context, LoginScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LoginSplashScreen.routeName),
      onTap: () {
        routePushNamed(context, LoginSplashScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(CaptchaScreen.routeName),
      onTap: () {
        routePushNamed(context, CaptchaScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserCreateScreen.routeName),
      onTap: () {
        routePushNamed(context, UserCreateScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LocationOpenScreen.routeName),
      onTap: () {
        routePushNamed(context, LocationOpenScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(NotificationOpenScreen.routeName),
      onTap: () {
        routePushNamed(context, NotificationOpenScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ImageUploadScreen.routeName),
      onTap: () {
        routePushNamed(context, ImageUploadScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ImagePickerScreen.routeName),
      onTap: () {
        routePushNamed(context, ImagePickerScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserCreateInfoScreen.routeName),
      onTap: () {
        routePushNamed(context, UserCreateInfoScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MainScreen.routeName),
      onTap: () {
        routePushNamed(context, MainScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(HomeScreen.routeName),
      onTap: () {
        routePushNamed(context, HomeScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(NotificationScreen.routeName),
      onTap: () {
        routePushNamed(context, NotificationScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DatingAddScreen.routeName),
      onTap: () {
        routePushNamed(context, DatingAddScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ChatListScreen.routeName),
      onTap: () {
        routePushNamed(context, ChatListScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MoreScreen.routeName),
      onTap: () {
        routePushNamed(context, MoreScreen.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaAssetSelector.routeName),
      onTap: () {
        routePushNamed(context, MediaAssetSelector.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaAlbumSelector.routeName),
      onTap: () {
        routePushNamed(context, MediaAlbumSelector.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaGridSelector.routeName),
      onTap: () {
        routePushNamed(context, MediaGridSelector.routeName);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaGridSelectorCrop.routeName),
      onTap: () {
        routePushNamed(context, MediaGridSelectorCrop.routeName);
      },
    ),
  ];
}

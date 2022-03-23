import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/captcha/pages/captcha.page.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat.page.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_bubble.widget.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_info.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_info.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_images.page.dart';
import 'package:seeks_app_prototype/core/dev/pages/default_page.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/home/pages/home.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_picker.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload_notify.page.dart';
import 'package:seeks_app_prototype/core/location/pages/location_open.page.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';
import 'package:seeks_app_prototype/core/login/pages/login_splash.page.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat_list.page.dart';
import 'package:seeks_app_prototype/core/media/components/media_asset_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_album_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';
import 'package:seeks_app_prototype/core/media/widgets/images_viewer.widget.dart';
import 'package:seeks_app_prototype/core/more/pages/more.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notfication.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notification_open.page.dart';
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
import 'package:seeks_app_prototype/core/dev/pages/dev_shared_preference.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_sqflite.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_url_launcher.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_webview.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_widget_key.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_widget_key_change.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_widget_key_change_less.dart';
import 'package:seeks_app_prototype/core/users/pages/user_create_info.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_create.page.dart';
import 'package:seeks_app_prototype/infrastructures/develop/pages/develop.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';
part 'dev_listVew.dart';
part 'widget_listVew.dart';

List<Widget> getAppView(BuildContext context) {
  return <Widget>[
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(EntryPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LoginPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          LoginPage.routeName,
        ]);
        // toRoutesNamed([join("", EntryPage.routeName, LoginPage.routeName));
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LoginSplashPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          LoginSplashPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(CaptchaPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          CaptchaPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserCreatePage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          UserCreatePage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LocationOpenPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          LocationOpenPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(NotificationOpenPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          NotificationOpenPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ImageUploadPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          ImageUploadPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ImagePickerPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          ImagePickerPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserCreateInfoPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          UserCreateInfoPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MainPage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(HomePage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          HomePage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(NotificationPage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          NotificationPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DatingAddImagesPage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          DatingAddImagesPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ChatListPage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          ChatListPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MorePage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          MorePage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ImageUploadNotifyPage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          ImageUploadNotifyPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DatingInfoPage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          DatingInfoPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DatingAddInfoPage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          DatingAddInfoPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ChatPage.routeName),
      onTap: () {
        toRoutesNamed([
          MainPage.routeName,
          ChatPage.routeName,
        ]);
      },
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_sliding_up_panel.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_sliding_up_panel2.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel_captcha.page.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat.page.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_bubble.widget.dart';
import 'package:seeks_app_prototype/core/chat/widgets/chat_list_item.widget.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_info.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_info.page.dart';
import 'package:seeks_app_prototype/core/dating/pages/dating_add_images.page.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_list_item.widget.dart';
import 'package:seeks_app_prototype/core/dev/pages/default_page.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_draggable_grid.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_getx2.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_nine_grid_view.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_reorderable_list.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/home/pages/home.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload_notify.page.dart';
import 'package:seeks_app_prototype/core/location/widgets/google_map.widget.dart';
import 'package:seeks_app_prototype/core/location/widgets/search_location.widget.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel.page.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/chat/pages/chat_list.page.dart';
import 'package:seeks_app_prototype/core/media/components/media_asset_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_album_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector.dart';
import 'package:seeks_app_prototype/core/media/components/media_grid_selector_crop.dart';
import 'package:seeks_app_prototype/core/media/pages/media_image_selector.page.dart';
import 'package:seeks_app_prototype/core/media/widgets/media_images_viewer.widget.dart';
import 'package:seeks_app_prototype/core/more/pages/more.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notfication.page.dart';
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
import 'package:seeks_app_prototype/core/notification/widgets/notifi_list_item.widget.dart';
import 'package:seeks_app_prototype/core/search/widgets/search.widget.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_swiper.widget.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_account.page.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_images_upload.page.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_location.page.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_push_notification.page.dart';
import 'package:seeks_app_prototype/core/signup/pages/signup_user_info.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_create_info.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_dating_list.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info.page.dart';
import 'package:seeks_app_prototype/core/users/pages/user_info_editor.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_item.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_label.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_list_title.widget.dart';
import 'package:seeks_app_prototype/core/users/widgets/user_info_title.widget.dart';
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
      title: Text(LoginTelPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          LoginTelPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(LoginTelCaptchaPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          LoginTelCaptchaPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(SignUpAccountPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          SignUpAccountPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(SignUpLocationPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          SignUpLocationPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(SignUpPushNotificationPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          SignUpPushNotificationPage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(SignUpImagesUpload.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          SignUpImagesUpload.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(SignUpUserInfoPage.routeName),
      onTap: () {
        toRoutesNamed([
          EntryPage.routeName,
          SignUpUserInfoPage.routeName,
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
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserDatingListPage.routeName),
      onTap: () {
        Get.to(() => UserDatingListPage());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserInfoPage.routeName),
      onTap: () {
        Get.to(() => UserInfoPage());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserInfoEditorPage.routeName),
      onTap: () {
        Get.to(() => UserInfoEditorPage());
      },
    ),
  ];
}

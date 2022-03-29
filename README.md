# seeks_app_prototype

seeks app prototype

A new Flutter project.
## source

- icon
  - [flaticon](https://www.flaticon.com/)

## 隨便紀錄

- 更改app name, icon
  - [Change Application Name and Icon in Flutter project(Android and iOS)](https://medium.com/@vaibhavi.rana99/change-application-name-and-icon-in-flutter-bebbec297c57)
  - https://www.flaticon.com/free-icon/online-dating_2232019?term=dating&page=1&position=23&page=1&position=23&related_id=2232019&origin=tag
  ```sh
  flutter clean
  flutter pub get
  flutter pub run flutter_launcher_icons:main 
  ```
- simulator keyboard not showing
  - https://stackoverflow.com/questions/24420873/xcode-6-keyboard-does-not-show-up-in-simulator
- text field
  - [Flutter 输入框(TextField)被键盘遮挡两种解决方案](https://blog.csdn.net/jia635/article/details/118307091)
  - [一文解决Flutter中使用TextField遇到的各种疑难杂症](https://blog.csdn.net/wapchief/article/details/119452704?spm=1001.2101.3001.6650.14&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-14.showsourcetag&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7EBlogCommendFromBaidu%7Edefault-14.showsourcetag)
  - [记录一个flutter TextField很坑的问题](https://blog.csdn.net/u013095264/article/details/98884630?spm=1001.2101.3001.6650.11&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-11.showsourcetag&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7Edefault-11.showsourcetag)
  - [《Flutter实战·第二版》- Preview 3.5 输入框及表单](https://book.flutterchina.club/chapter3/input_and_form.html#_3-5-1-textfield)
- [StatefulWidget/StatelessWidget 传参及使用](https://blog.csdn.net/weixin_42322441/article/details/109237716)
- [How to Build a Chat App UI With Flutter and Dart](https://www.freecodecamp.org/news/build-a-chat-app-ui-with-flutter/)

- [nicee](https://www.nicee.tw/)
- 

## lib
- flutter_launcher_icons: ^0.8.1
- flutter_libphonenumber?
- [extended_image](https://pub.dev/packages/extended_image)
- [dash_chat](https://pub.dev/packages/dash_chat)
- [swipe_to](https://pub.dev/packages/swipe_to)
- [drag_select_grid_view](https://pub.dev/packages/drag_select_grid_view)
- [modal_bottom_sheet](https://pub.flutter-io.cn/packages/modal_bottom_sheet)
- [sticky_headers](https://pub.dev/packages/sticky_headers)
- [webview_flutter](https://pub.dev/packages/webview_flutter/install)
- [url_launcher](https://pub.dev/packages/url_launcher)
- [local_auth](https://pub.dev/packages/local_auth)
- [location](https://pub.dev/packages/location)
- [mapbox_gl](https://pub.dev/packages/mapbox_gl)
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter)
- [flutter_map](https://pub.dev/packages/flutter_map)
- [heremaps/here-sdk-ref-app-flutter](https://github.com/heremaps/here-sdk-ref-app-flutter)
- [firebase_messaging](https://pub.dev/packages/firebase_messaging)
- [firebase_core](https://pub.dev/packages/firebase_core)
- [flutter_staggered_grid_view](https://pub.dev/packages/flutter_staggered_grid_view)
- [timeline_tile](https://pub.dev/packages/timeline_tile)
- [animated_text_kit](https://pub.dev/packages/animated_text_kit)
- [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- [flutter_chat_bubble](https://pub.dev/packages/flutter_chat_bubble)
- [flutter_rating_bar](https://pub.dev/packages/flutter_rating_bar)
- [percent_indicator](https://pub.dev/packages/percent_indicator)
- [charts_flutter](https://pub.dev/packages/charts_flutter)
- [card_swiper](https://pub.dev/packages/card_swiper)

## ISSUE

### 手勢Widget
- [沒想到Flutter也能實現如此絲般順滑的上拉抽屜動畫效果](https://www.gushiciku.cn/dc_hk/200123186)

### Wrap 使用方式
- Wrap 使用中子Widget 有Row 會無法水平擴展

### GetX
- [Flutter GetX使用---簡潔的魅力！](https://iter01.com/584026.html)
- [Flutter状态管理框架使用比较](https://blog.csdn.net/blog_jihq/article/details/114288114)

### Flutter 狀態管理
- [Flutter状态管理框架使用比较](https://blog.csdn.net/blog_jihq/article/details/114288114)


### 地圖
- [[1-1] 該選哪種地圖API？小孩子才做選擇。](https://ithelp.ithome.com.tw/articles/10238282)
- [Creating a route calculator using Google Maps in Flutter](https://blog.codemagic.io/creating-a-route-calculator-using-google-maps/)

#### google map style
- [Switch to Dark Mode in Real-Time With Flutter and Google Maps](https://medium.com/swlh/switch-to-dark-mode-in-real-time-with-flutter-and-google-maps-f0f080cd72e9)
- [https://mapstyle.withgoogle.com/](https://mapstyle.withgoogle.com/)

### webview
- [如何在 Flutter 中使用 WebView？- 小女 Android 工程師實驗筆記](https://chloe-thhsu.medium.com/%E5%A6%82%E4%BD%95%E5%9C%A8-flutter-%E4%B8%AD%E4%BD%BF%E7%94%A8-webview-%E5%B0%8F%E5%A5%B3-android-%E5%B7%A5%E7%A8%8B%E5%B8%AB%E5%AF%A6%E9%A9%97%E7%AD%86%E8%A8%98-75969b36abba)
- [與 Flutter WebView 奮鬥的那些日子](https://danielkao.medium.com/%E8%88%87-flutter-webview-%E5%A5%AE%E9%AC%A5%E7%9A%84%E6%95%85%E4%BA%8B-a353f0094734)

### url 連動app

### ios ui 視差路由
- [modal_bottom_sheet](https://pub.flutter-io.cn/packages/modal_bottom_sheet)
- [Flutter 搓個IOS風格的視差路由動畫](https://www.gushiciku.cn/pl/aJj7/zh-tw)
- [如何使用 Flutter 更好的平滑视差效果？](https://rtcdeveloper.agora.io/t/topic/20581)

### list remove error
> Concurrent modification during iteration: Instance(length:2) of '_GrowableList'.
- [flutter中Dart報Concurrent modification during iteration: Instance(length:4) of ‘_GrowableList‘.](https://www.796t.com/article.php?id=207788)
- [Flutter Unhandled Exception: Concurrent modification during iteration: Instance(length:3) of ‘_Growa](https://blog.csdn.net/zl18603543572/article/details/107553183)

### PageView 重複初始化
- [flutter PageView重复初始化](https://blog.csdn.net/qq_24523279/article/details/107026842)
- [Flutter页面保活及保持页面跳转位置](https://juejin.cn/post/6844903823710879758)
- [《Flutter实战·第二版》可滚动组件子项缓存 KeepAlive](https://book.flutterchina.club/chapter6/keepalive.html)
- [Flutter PageView/TabBarView等控件保存状态的问题解决方案](https://blog.csdn.net/GYBIN02/article/details/106524679)
### PageView 滑動監控
- [Flutter PageView 使用详细概述](https://juejin.cn/post/6894992574437425159)


### ios 企業憑證



## fcm

```
flutter: User granted permission: AuthorizationStatus.denied
flutter: APNSToken: 5A35183762724398D5AF6D7E814B5F7533AA822C6A2CCB81452DF41CC866C8E1
flutter: FCMToken: dUiJHrhrGEG9msxQSQ9xuw:APA91bH8MSHpe8EZDA98IR9h6fUal1MSRhsr_SsKmsWZw9iMr1BAVyMO9Gs_-iUrQFDqGSoUwZ6G6uSiLXMvGwM7SY71USBJcz_ksddocaAYahMFdt2y94MPqZT3mReJkW5nDmUSh-zC

flutter: User granted permission: AuthorizationStatus.denied
flutter: APNSToken: 35D4D2167DB5C476F5956AC576790F6FBAF0A68271DAAF5BF1A138909A0C09F6
flutter: FCMToken: f2DTfW6CZ0EFlAdnaTPhO0:APA91bGLzrd5ZTQvoId4FyCPAWrQGWgMOp4lLh9tGYNccWxD-iq3YYlpFo8-T9MUCnI5K36pwUjUdW2hBOkDXQaww_wgIlq5EjAfkEsQxaWeeUqr5v2t7otb7FJ9PTRNtI5VNUeJ8vYb
```
part of 'dev_pages.dart';

abstract class DevRoutes {
  static List<GetPage<dynamic>> mainRoutes = [
    GetPage(
      name: DevEntryPage.routeName,
      page: () => DevEntryPage(),
      binding: DevPagesBind(),
      children: [
        GetPage(
          name: DefaultPage.routeName,
          page: () => DefaultPage(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevImagePicker.routeName,
          page: () => DevImagePicker(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevImagePickers.routeName,
          page: () => DevImagePickers(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevImageIGPicker.routeName,
          page: () => DevImageIGPicker(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevImageCropper.routeName,
          page: () => DevImageCropper(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevCarouselSlider.routeName,
          page: () => DevCarouselSlider(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevPicker.routeName,
          page: () => DevPicker(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevAlert.routeName,
          page: () => DevAlert(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevSharedPreference.routeName,
          page: () => DevSharedPreference(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevListViewMsg.routeName,
          page: () => DevListViewMsg(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevListViewRefresh.routeName,
          page: () => DevListViewRefresh(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevListViewStickyHeader.routeName,
          page: () => DevListViewStickyHeader(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevListViewSlidable.routeName,
          page: () => DevListViewSlidable(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevListViewCheckbox.routeName,
          page: () => DevListViewCheckbox(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevListViewCheckbox.routeName,
          page: () => DevListViewCheckbox(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevCustomScrollView.routeName,
          page: () => DevCustomScrollView(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevBottomNavigationTabBar.routeName,
          page: () => DevBottomNavigationTabBar(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevProvider.routeName,
          page: () => DevProvider(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevApiGet.routeName,
          page: () => DevApiGet(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevApiPost.routeName,
          page: () => DevApiPost(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevPathProvider.routeName,
          page: () => DevPathProvider(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevLifeCycle.routeName,
          page: () => DevLifeCycle(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevInheritedWidget.routeName,
          page: () => DevInheritedWidget(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevNotification.routeName,
          page: () => DevNotification(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevLocalStorage.routeName,
          page: () => DevLocalStorage(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevGetX.routeName,
          page: () => DevGetX(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevPhotoManager.routeName,
          page: () => DevPhotoManager(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevPhotoManagerV2.routeName,
          page: () => DevPhotoManagerV2(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevPhotoManagerV3.routeName,
          page: () => DevPhotoManagerV3(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevSqflite.routeName,
          page: () => DevSqflite(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevListViewChat.routeName,
          page: () => DevListViewChat(),
          binding: DevPagesBind(),
        ),
        // DevRoutes.defaultPage
        GetPage(
          name: DevEntryPage.routeName,
          page: () => DevEntryPage(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevWidgetKey.routeName,
          page: () => DevWidgetKey(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevWidgetKeyChange.routeName,
          page: () => DevWidgetKeyChange(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevWidgetKeyChangeLess.routeName,
          page: () => DevWidgetKeyChangeLess(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevUrlLauncher.routeName,
          page: () => DevUrlLauncher(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevWebView.routeName,
          page: () => DevWebView(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevBiometric.routeName,
          page: () => DevBiometric(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevGeoLocator.routeName,
          page: () => DevGeoLocator(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevGoogleMap.routeName,
          page: () => DevGoogleMap(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevFirebaseFCM.routeName,
          page: () => DevFirebaseFCM(),
          binding: DevPagesBind(),
        ),
        GetPage(
          name: DevProvider2.routeName,
          page: () => DevProvider2(),
          binding: DevPagesBind(),
        ),
      ],
    ),
  ];
}

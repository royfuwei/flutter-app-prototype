part of 'app_listVew.dart';

List<Widget> getDevView(BuildContext context) {
  return <Widget>[
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DefaultPage.routeName),
      onTap: () {
        toRoutesNamed(
          [
            DevEntryPage.routeName,
            DefaultPage.routeName,
            "/?title=Flutter 起始頁面"
          ],
          arguments: {'title': 'Flutter Default Page'},
        );
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevImagePicker.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevImagePicker.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevImagePickers.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevImagePickers.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevImageIGPicker.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevImageIGPicker.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevImageCropper.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevImageCropper.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevCarouselSlider.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevCarouselSlider.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPicker.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevPicker.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevAlert.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevAlert.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewMsg.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevListViewMsg.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewRefresh.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevListViewRefresh.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewStickyHeader.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevListViewStickyHeader.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewSlidable.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevListViewSlidable.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewCheckbox.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevListViewCheckbox.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevSharedPreference.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevSharedPreference.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevCustomScrollView.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevCustomScrollView.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevBottomNavigationTabBar.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevBottomNavigationTabBar.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevProvider.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevProvider.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevApiGet.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevApiGet.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevApiPost.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevApiPost.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPathProvider.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevPathProvider.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevLifeCycle.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevLifeCycle.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevInheritedWidget.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevInheritedWidget.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevNotification.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevNotification.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevLocalStorage.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevLocalStorage.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevGetX.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevGetX.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPhotoManager.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevPhotoManager.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPhotoManagerV2.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevPhotoManagerV2.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevPhotoManagerV3.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevPhotoManagerV3.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevSqflite.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevSqflite.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevListViewChat.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevListViewChat.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevWidgetKey.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevWidgetKey.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevWidgetKeyChange.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevWidgetKeyChange.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevWidgetKeyChangeLess.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevWidgetKeyChangeLess.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevUrlLauncher.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevUrlLauncher.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevWebView.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevWebView.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevBiometric.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevBiometric.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevGeoLocator.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevGeoLocator.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevGoogleMap.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevGoogleMap.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevFirebaseFCM.routeName),
      onTap: () {
        toRoutesNamed([
          DevEntryPage.routeName,
          DevFirebaseFCM.routeName,
        ]);
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DevSwiperWidget.routeName),
      onTap: () {
        Get.to(() => DevSwiperWidget());
      },
    ),
  ];
}

part of 'app_listVew.dart';

List<Widget> getWidgetView(BuildContext context) {
  return <Widget>[
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaAssetSelectorComponent.routeName),
      onTap: () {
        Get.to(() => MediaAssetSelectorComponent());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaAlbumSelectorComponent.routeName),
      onTap: () {
        Get.to(() => MediaAlbumSelectorComponent());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaGridSelector.routeName),
      onTap: () {
        Get.to(() => MediaGridSelector());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaGridSelectorCrop.routeName),
      onTap: () {
        Get.to(() => MediaGridSelectorCrop());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaImageSelectorPage.routeName),
      onTap: () {
        Get.to(() => MediaImageSelectorPage());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaImagesViewerWidget.routeName),
      onTap: () {
        Get.to(() => MediaImagesViewerWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ChatBubbleWidget.widgetName + " receiverBubble"),
      onTap: () {
        Get.to(() => ChatBubbleWidget(
              isCurrentUser: false,
              text: "聊天內容測試........",
            ));
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ChatBubbleWidget.widgetName + " sendBubble"),
      onTap: () {
        Get.to(() => ChatBubbleWidget(
              isCurrentUser: true,
              text: """
聊天內容測試........
123
abc""",
            ));
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(SearchLocationWidget.routeName),
      onTap: () {
        Get.to(() => SearchLocationWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(GoogleMapWidget.routeName),
      onTap: () {
        Get.to(() => GoogleMapWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(SearchWidget.routeName),
      onTap: () {
        Get.to(() => SearchWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserInfoWidget.routeName),
      onTap: () {
        Get.to(() => UserInfoWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserInfoLabelWidget.routeName),
      onTap: () {
        Get.to(() => UserInfoLabelWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DatingListItem.routeName),
      onTap: () {
        Get.to(() => DatingListItem());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserInfoTitleWidget.routeName),
      onTap: () {
        Get.to(() => UserInfoTitleWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserInfoListItemWidget.routeName),
      onTap: () {
        Get.to(() => UserInfoListItemWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(UserInfoListTitleWidget.routeName),
      onTap: () {
        Get.to(() => UserInfoListTitleWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ChatListItemWidget.routeName),
      onTap: () {
        Get.to(() => ChatListItemWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(NotifiListItem.routeName),
      onTap: () {
        Get.to(() => NotifiListItem());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(AnnounBoardSwiperWidget.routeName),
      onTap: () {
        Get.to(() => AnnounBoardSwiperWidget());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(AnnounBoardComponent.routeName),
      onTap: () {
        Get.to(() => AnnounBoardComponent());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(DatingInfoBodyComponent.routeName),
      onTap: () {
        Get.to(() => DatingInfoBodyComponent());
      },
    ),
  ];
}

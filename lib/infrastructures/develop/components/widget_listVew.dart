part of 'app_listVew.dart';

List<Widget> getWidgetView(BuildContext context) {
  return <Widget>[
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaAssetSelector.routeName),
      onTap: () {
        Get.to(() => MediaAssetSelector());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(MediaAlbumSelector.routeName),
      onTap: () {
        Get.to(() => MediaAlbumSelector());
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
      title: Text(ImageSelectorPage.routeName),
      onTap: () {
        Get.to(() => ImageSelectorPage());
      },
    ),
    ListTile(
      leading: new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      title: Text(ImagesViewerWidget.routeName),
      onTap: () {
        Get.to(() => ImagesViewerWidget());
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
  ];
}

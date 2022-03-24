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
  ];
}

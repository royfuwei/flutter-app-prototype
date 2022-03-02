import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

enum SliableType {
  archive,
  share,
  more,
  delete,
}

class SliableItem {
  final String title;
  final String subTitle;
  final Widget motion;
  final bool canDelete;

  SliableItem({
    required this.title,
    required this.subTitle,
    required this.motion,
    required this.canDelete,
  });
}

class DevListViewSlidable extends StatefulWidget {
  static String routeName = "dev/listview/slidalbe";
  const DevListViewSlidable({Key? key}) : super(key: key);

  @override
  _DevListViewSlidableState createState() => _DevListViewSlidableState();
}

class _DevListViewSlidableState extends State<DevListViewSlidable> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<SliableItem> slidableItems = [
    SliableItem(
        title: "Behind效果",
        subTitle: "Action像在Tile的背面\n(最靠外面的Action最先出現)",
        motion: BehindMotion(),
        canDelete: false),
    SliableItem(
        title: "Scroll效果",
        subTitle: "Action像在Tile的兩側\n(最靠中間的Action最先出現)",
        motion: ScrollMotion(),
        canDelete: false),
    SliableItem(
        title: "Strech效果",
        subTitle: "Action像在Tile的兩側\n(Action同時出現, 沒有重疊的感覺)",
        motion: StretchMotion(),
        canDelete: false),
    SliableItem(
        title: "Drawer效果",
        subTitle: "Action像在Tile的兩側\n(Action同時出現, 會有重疊的感覺)",
        motion: BehindMotion(),
        canDelete: false),
    SliableItem(
        title: "送我一程吧~~~~",
        subTitle: "",
        motion: StretchMotion(),
        canDelete: true),
  ];

  getStartActionMenu(int index) {
    return [
      SlidableAction(
        onPressed: (_) {
          deleteListItem(index);
        },
        backgroundColor: Color(0xFFFE4A49),
        foregroundColor: Colors.white,
        icon: Icons.delete,
        label: '刪除',
      ),
      SlidableAction(
        onPressed: doNothing,
        backgroundColor: Color(0xFF21B7CA),
        foregroundColor: Colors.white,
        icon: Icons.share,
        label: '分享',
      ),
    ];
  }

  deleteListItem(int index) {
    final scaffold = ScaffoldMessenger.of(context);
    setState(() {
      scaffold.showSnackBar(
        SnackBar(
          content:
              Text('remove slidableItems title:${slidableItems[index].title}'),
          action: SnackBarAction(
            label: 'Cancel',
            onPressed: () {
              scaffold.removeCurrentSnackBar();
            },
          ),
        ),
      );
      slidableItems.removeAt(index);
    });
  }

  getEndActionMenu(int index) {
    return [
      SlidableAction(
        // An action can be bigger than the others.
        // flex: 2,
        onPressed: doNothing,
        backgroundColor: Color(0xFF7BC043),
        foregroundColor: Colors.white,
        // icon: Icons.archive,
        label: 'Archive',
      ),
      SlidableAction(
        onPressed: doNothing,
        backgroundColor: Color(0xFF0392CF),
        foregroundColor: Colors.white,
        // icon: Icons.save,
        label: 'Save',
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list view slidable"),
      ),
      body: listViewBuilder(),
    );
  }

  createSlidableListTile(int index) {
    final slidableItem = slidableItems[index];
    return Slidable(
      key: Key(slidableItem.title),
      startActionPane: ActionPane(
        // extentRatio: 0.1 * (index + 1),
        // A motion is a widget used to control how the pane animates.
        motion: slidableItem.motion,
        // A pane can dismiss the Slidable.
        // All actions are defined in the children parameter.
        children: getStartActionMenu(index),
      ),
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: slidableItem.motion,
        children: getEndActionMenu(index),
      ),
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(slidableItem.title),
          subtitle: Text(slidableItem.subTitle),
          isThreeLine: true,
          leading: CircleAvatar(
            child: Text('$index'),
            foregroundColor: Colors.white,
            backgroundColor: Colors.orange,
          ),
        ),
      ),
    );
  }

  createSlidableDismissalListTile(int index) {
    final slidableItem = slidableItems[index];
    return Slidable(
      key: Key(slidableItem.title),
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: slidableItem.motion,
        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          deleteListItem(index);
        }),
        // All actions are defined in the children parameter.
        children: getStartActionMenu(index),
      ),
      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: slidableItem.motion,
        children: getEndActionMenu(index),
      ),
      child: Container(
        color: Colors.white,
        child: ListTile(
          title: Text(
            slidableItem.title,
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }

  listViewBuilder() {
    return ListView.builder(
      itemCount: slidableItems.length,
      itemBuilder: (context, index) {
        final slidableItem = slidableItems[index];
        if (slidableItem.canDelete) {
          return createSlidableDismissalListTile(index);
        } else {
          return createSlidableListTile(index);
        }
      },
    );
  }
}

void doNothing(BuildContext context) {}

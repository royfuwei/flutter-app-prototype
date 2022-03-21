import 'dart:math';

import 'package:flutter/material.dart';

// 點選按鈕，交換兩個 widget 的位置。
// Flutter渲染之通過demo瞭解Key的作用 https://iter01.com/514563.html
// Flutter 中的 ListView 的一个容易忽略的知识点 https://juejin.cn/post/6845166891577671688
// Flutter渲染之Widget、Element 和 RenderObject https://juejin.cn/post/6845166891539906574

class DevWidgetKeyChange extends StatefulWidget {
  static String routeName = "/dev/widget/key_change";
  const DevWidgetKeyChange({Key? key}) : super(key: key);

  @override
  _DevWidgetKeyChangeState createState() => _DevWidgetKeyChangeState();
}

class _DevWidgetKeyChangeState extends State<DevWidgetKeyChange> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> tiles = [
    StatelessColorfulTile(
      "a",
      key: UniqueKey(),
    ),
    StatelessColorfulTile(
      "b",
      key: UniqueKey(),
    ),
  ];

  Widget _itemForRow(BuildContext context, int index) {
    return tiles[index];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget key change"),
      ),
      body: Column(
        children: tiles,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.published_with_changes_rounded),
        onPressed: () {
          setState(() {
            tiles.insert(1, tiles.removeAt(0));
          });
        },
      ),
    );
  }
}

class StatelessColorfulTile extends StatefulWidget {
  String name;
  StatelessColorfulTile(this.name, {Key? key}) : super(key: key);
  @override
  _StatelessColorfulTileState createState() => _StatelessColorfulTileState();
}

class _StatelessColorfulTileState extends State<StatelessColorfulTile> {
  bool isTap = false;
  Color myColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("widget.key: ${widget.key}");
        print("widget.name: ${widget.name}");
        setState(() {
          isTap = !isTap;
        });
      },
      child: Container(
        color: myColor,
        child: Padding(
          padding: EdgeInsets.all(70.0),
          child: Row(
            mainAxisAlignment:
                isTap ? MainAxisAlignment.end : MainAxisAlignment.center,
            children: [
              Text(
                "${widget.name}",
              )
            ],
          ),
        ),
      ),
    );
  }
}

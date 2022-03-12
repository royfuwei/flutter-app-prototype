import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

// 點選按鈕，交換兩個 widget 的位置。

class DevWidgetKeyChangeLess extends StatefulWidget {
  static String routeName = "dev/widget/key_change_less";
  const DevWidgetKeyChangeLess({Key? key}) : super(key: key);

  @override
  _DevWidgetKeyChangeLessState createState() => _DevWidgetKeyChangeLessState();
}

class _DevWidgetKeyChangeLessState extends State<DevWidgetKeyChangeLess> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Widget> tiles = [
    // StatelessColorfulTile(),
    // StatelessColorfulTile(),
    StatelessColorfulTileLess("a"),
    StatelessColorfulTileLess("b"),
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
        title: Text("Widget key change stateless"),
      ),
      body: Column(
        children: tiles,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            tiles.insert(1, tiles.removeAt(0));
          });
        },
      ),
    );
  }
}

class StatelessColorfulTileLess extends StatelessWidget {
  String name = '';
  StatelessColorfulTileLess(this.name);
  Color myColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("this.name: ${name}");
      },
      child: Container(
        color: myColor,
        child: Padding(padding: EdgeInsets.all(70.0)),
      ),
    );
  }
}

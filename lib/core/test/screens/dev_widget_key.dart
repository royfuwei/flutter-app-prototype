import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevWidgetKey extends StatefulWidget {
  static String routeName = "dev/widget/key";
  const DevWidgetKey({Key? key}) : super(key: key);

  @override
  _DevWidgetKeyState createState() => _DevWidgetKeyState();
}

class _DevWidgetKeyState extends State<DevWidgetKey> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _names = ["1", "2", "3", "4", "5", "6", "7"];

  @override
  void initState() {
    super.initState();
  }

  static bool canUpdate(Widget oldWidget, Widget newWidget) {
    return oldWidget.runtimeType == newWidget.runtimeType &&
        oldWidget.key == newWidget.key;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget key"),
      ),
      body: ListView(
        children: _names.map((item) {
          return KeyItemLessWidget(item, key: Key(item));
          // return KeyItemLessWidget(item);
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          setState(() {
            _names.removeAt(2);
            // _names.add("${_names.length + 1}");
          });
        },
      ),
    );
  }
}

class KeyItemLessWidget extends StatefulWidget {
  final String name;

  KeyItemLessWidget(this.name, {Key? key}) : super(key: key);

  @override
  _KeyItemLessWidgetState createState() => _KeyItemLessWidgetState();
}

class _KeyItemLessWidgetState extends State<KeyItemLessWidget>
    with WidgetsBindingObserver {
  final randColor = Color.fromARGB(
      255, Random().nextInt(256), Random().nextInt(256), Random().nextInt(256));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${widget.name}: A1. widget initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("${widget.name}:  A2. widget didChangeDependencies");
  }

  @override
  void didUpdateWidget(KeyItemLessWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("${widget.name}: A3. widget didUpdateWidget");
    print("oldWidget: ${oldWidget}");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("${widget.name}: D1. widget reassemble");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("${widget.name}: Z1. widget deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    print("${widget.name}: Z2. widget dispose");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.name,
        style: TextStyle(color: Colors.white, fontSize: 50),
      ),
      height: 80,
      color: randColor,
    );
  }
}

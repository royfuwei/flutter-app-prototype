import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevNotification extends StatefulWidget {
  static String routeName = "dev/notification";
  const DevNotification({Key? key}) : super(key: key);

  @override
  _DevNotificationState createState() => _DevNotificationState();
}

final maxLevel = 7;

class _DevNotificationState extends State<DevNotification> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("notification"),
      ),
      body: Column(
        children: [
          PyramidWidget(level: 1),
        ],
      ),
    );
  }
}

class PyramidWidget extends StatefulWidget {
  final int level;
  const PyramidWidget({
    Key? key,
    required this.level,
  }) : super(key: key);

  @override
  _PyramidWidgetState createState() => _PyramidWidgetState();
}

class _PyramidWidgetState extends State<PyramidWidget> {
  final fireSecond = 1;
  final cubeLong = 25.0;
  bool showLevel = false;

  void fireAfter(int sec) {
    Future.delayed(Duration(seconds: sec)).then((value) {
      print("go");
      PyramidNotification(true).dispatch(context);
    });
  }

  @override
  void initState() {
    super.initState();
    print(widget.level);

    if (widget.level == maxLevel) {
      showLevel = true;
      print("me");

      fireAfter(fireSecond);
    }
  }

  @override
  Widget build(BuildContext context) {
    final levelText = Text(
      widget.level.toString(),
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );

    final pyramid = Container(
      width: cubeLong * (widget.level * 2 - 1),
      height: cubeLong * (maxLevel + 1 - widget.level),
      color: rainbowColors[widget.level - 1],
      child: showLevel ? levelText : Container(),
    );

    final stack = Container(
      color: Color.fromRGBO(0, 0, 0, 0),
      child: Stack(alignment: Alignment.bottomCenter, children: [
        pyramid,
        widget.level == maxLevel
            ? Container()
            : PyramidWidget(level: widget.level + 1), //容器的部分
      ]),
    );

    return NotificationListener<PyramidNotification>(
        onNotification: (notifi) {
          print("come");
          if (notifi.ok) {
            fireAfter(fireSecond);
            setState(() {
              showLevel = true;
            });
          }
          return true; //是否到此為止, true: Stop; false: Bubbling
        },
        child: stack);
  }
}

final rainbowColors = [
  Colors.red,
  Colors.orangeAccent,
  Colors.yellowAccent,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];

class PyramidNotification extends Notification {
  final bool ok;
  PyramidNotification(this.ok);
}

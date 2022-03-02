import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class DevListViewCheckbox extends StatefulWidget {
  static String routeName = "dev/listview/checkbox";
  const DevListViewCheckbox({Key? key}) : super(key: key);

  @override
  _DevListViewCheckboxState createState() => _DevListViewCheckboxState();
}

class _DevListViewCheckboxState extends State<DevListViewCheckbox> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<bool> checkList = List.generate(shrines.length, (index) => false);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("list view checkbox"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              child: TextButton(
                child: Text(
                    "資料來源：\n[分享]薩爾達傳說 曠野之息【神廟】中 英 對照表 @ 流浪。生活誌 :: 痞客邦 ::",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
                onPressed: () {},
              ),
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (ctx, idx) => Divider(),
                itemCount: shrines.length,
                itemBuilder: (ctx, idx) {
                  return CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: Icon(IcoFontIcons.like),
                    activeColor: Colors.orange,
                    value: checkList[idx],
                    selected: checkList[idx],
                    onChanged: (check) {
                      setState(() {
                        checkList[idx] = check!;
                      });
                    },
                    title: Text("${shrines[idx]}"),
                  );
                },
              ),
            ),
            VerticalSpacing(
              of: 20,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (ctx, idx) => Divider(),
                itemCount: shrines.length,
                itemBuilder: (ctx, idx) {
                  return SwitchListTile(
                    key: Key("SwitchListTile:${idx}"),
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: Icon(IcoFontIcons.like),
                    activeColor: Colors.orange,
                    value: checkList[idx],
                    selected: checkList[idx],
                    onChanged: (check) {
                      setState(() {
                        checkList[idx] = check;
                      });
                    },
                    title: Text("${shrines[idx]}"),
                  );
                },
              ),
            ),
            VerticalSpacing(
              of: 20,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (ctx, idx) => Divider(),
                itemCount: shrines.length,
                itemBuilder: (ctx, idx) {
                  return Container(
                    key: Key("CupertinoSwitch:${idx}"),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            // vertical: 5,
                          ),
                          child: CupertinoSwitch(
                            // activeColor: Colors.orange,
                            value: checkList[idx],
                            onChanged: (check) {
                              setState(() {
                                checkList[idx] = check;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              // vertical: 5,
                            ),
                            child: Text("${shrines[idx]}"),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            // vertical: 5,
                          ),
                          child: Icon(IcoFontIcons.like),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            VerticalSpacing(
              of: 20,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (ctx, idx) => Divider(),
                itemCount: shrines.length,
                itemBuilder: (ctx, idx) {
                  return Container(
                    key: Key("CupertinoSwitch:${idx}"),
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            // vertical: 5,
                          ),
                          child: CustomSwitch(
                            // activeColor: Colors.orange,
                            value: checkList[idx],
                            onChanged: (check) {
                              setState(() {
                                checkList[idx] = check;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              // vertical: 5,
                            ),
                            child: Text("${shrines[idx]}"),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                            left: 10,
                            // vertical: 5,
                          ),
                          child: Icon(IcoFontIcons.like),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Container(
              // color: Colors.black,
              child: TextButton(
                child: Text(
                  "checkList length: ${checkList.length}",
                  textAlign: TextAlign.center,
                  // style: TextStyle(color: Colors.white),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final shrines = [
  "117)耀瓦卡‧伊爾塔神廟 Yowaka Ita Shrine ",
  "118)羅希塔‧奇古神廟 Rohta Chigah Shrine"
];

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  const CustomSwitch({
    Key? key,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 60));
    _circleAnimation = AlignmentTween(
            begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
            end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
            parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 45.0,
            height: 28.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: !widget.value ? Colors.grey : Colors.blue,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 2.0, bottom: 2.0, right: 2.0, left: 2.0),
              child: Container(
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

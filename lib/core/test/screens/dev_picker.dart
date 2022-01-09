import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';

class DevPicker extends StatefulWidget {
  static String routeName = "dev/picker";
  const DevPicker({Key? key}) : super(key: key);

  @override
  _DevPickerState createState() => _DevPickerState();
}

class _DevPickerState extends State<DevPicker> {
  double bottomWidgetHeight = 0.01;
  String choosed = "你選擇的是";
  late Widget selector = Container();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Text> items = [
    Text("test1"),
    Text("test2"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text("picker"),
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 30),
            color: colorIconAdd,
            child: Text(choosed),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading:
                      new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
                  title: Text('iOS DatePicker'),
                  onTap: () {
                    showDatePicker(context);
                  },
                ),
                ListTile(
                  leading:
                      new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
                  title: Text('Android TimePicker'),
                  onTap: () async {
                    var date = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                      initialEntryMode: TimePickerEntryMode.input,
                    );

                    setState(
                      () {
                        choosed = date == null ? "沒選= =" : "${date.toString()}";
                      },
                    );
                  },
                ),
                ListTile(
                  leading:
                      new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
                  title: Text('ActionSheet'),
                  onTap: () async {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (BuildContext context) => getActionSheet(),
                    );
                  },
                ),
                ListTile(
                  leading:
                      new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
                  title: Text('BottomSheet 滑動'),
                  onTap: () async {
                    setState(
                      () {
                        bottomWidgetHeight = 0.01;
                      },
                    );

                    showMediaBottomSheet(
                      context,
                      scaffoldKey.currentState!,
                    ); //滑動
                  },
                ),
                ListTile(
                  leading:
                      new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
                  title: Text('BottomSheet 蓋頁'),
                  onTap: () async {
                    setState(
                      () {
                        bottomWidgetHeight = 0.01;
                      },
                    );
                    showModalMediaBottomSheet(context); //蓋頁
                  },
                ),
                ListTile(
                  leading:
                      new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
                  title: Text('showSelectorPicker'),
                  onTap: () async {
                    showSelectorPicker(context);
                  },
                ),
                ListTile(
                  leading:
                      new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
                  title: Text('showMulitSelectorPicker'),
                  onTap: () async {
                    showMulitSelectorPicker(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDatePicker(BuildContext context) {
    late DateTime pickDatetime;
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return Container(
          color: Colors.greenAccent,
          height: 400,
          child: Column(
            children: [
              Container(
                height: 300,
                child: CupertinoDatePicker(
                  onDateTimeChanged: (date) {
                    pickDatetime = date;
                  },
                ),
              ),
              CupertinoButton(
                child: Text('OK'),
                onPressed: () {
                  setState(() {
                    choosed = "$pickDatetime";
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showModalMediaBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (BuildContext bc) => getMediaWrap());
  }

  void showMediaBottomSheet(BuildContext context, ScaffoldState scaffoldState) {
    scaffoldState.showBottomSheet((context) => getMediaWrap());
  }

  void showMulitSelectorPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return Container(
          color: Colors.greenAccent,
          height: 200,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 100,
                      child: getSelectorPicker(items),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 100,
                      child: getSelectorPicker(items),
                    ),
                  ),
                ],
              ),
              CupertinoButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void showSelectorPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) {
        return Container(
          color: Colors.greenAccent,
          height: 200,
          child: Column(
            children: [
              Container(
                height: 100,
                child: getSelectorPicker(items),
              ),
              CupertinoButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  getSelectorPicker(List<Text> items) {
    return CupertinoPicker(
      itemExtent: 30,
      onSelectedItemChanged: (position) {},
      children: items,
    );
  }

  getMediaWrap() {
    return Container(
      padding: EdgeInsets.only(),
      color: Colors.greenAccent,
      child: SafeArea(
        child: Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Music'),
                onTap: () => {
                      setState(() {
                        choosed = "音樂";
                        Navigator.pop(context);
                      })
                    }),
            ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () => {
                setState(() {
                  choosed = "影片";
                  Navigator.pop(context);
                })
              },
            ),
            /* VerticalSpacing(
              of: 50,
            ), */
          ],
        ),
      ),
    );
  }

  getActionSheet() {
    return CupertinoActionSheet(
      message: Text("選一個你喜歡的圖案吧"),
      cancelButton: CupertinoActionSheetAction(
        child: Text("都不喜歡"),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        CupertinoActionSheetAction(
          child: Icon(Icons.all_inclusive),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              choosed = "無限";
            });
          },
        ),
        CupertinoActionSheetAction(
          child: Icon(Icons.ac_unit),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              choosed = "冰雪";
            });
          },
        ),
        CupertinoActionSheetAction(
          child: Icon(Icons.help_outline),
          onPressed: () {
            Navigator.pop(context);
            setState(() {
              choosed = "疑問";
            });
          },
        )
      ],
    );
  }
}

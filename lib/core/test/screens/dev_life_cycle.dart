import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';

class LessonPageX extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Container());
  }
}

class LessonPageY extends StatefulWidget {
  @override
  _LessonPageYState createState() => _LessonPageYState();
}

class _LessonPageYState extends State<LessonPageY> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: Container());
  }
}

class DevLifeCycle extends StatefulWidget {
  static String routeName = "dev/lifeCycle";
  const DevLifeCycle({Key? key}) : super(key: key);

  @override
  _DevLifeCycleState createState() => _DevLifeCycleState();
}

class _DevLifeCycleState extends State<DevLifeCycle>
    with WidgetsBindingObserver {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool gone = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    print('A1. widget initState');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("A2. widget didChangeDependencies");
  }

  @override
  void didUpdateWidget(DevLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("A3. widget didUpdateWidget");
  }

  final TestUpdateWidget test1 = TestUpdateWidget();
  TestUpdateWidget test2 = TestUpdateWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("lifeCycle"),
      ),
      body: Column(
        children: [
          Center(
              child: IconButton(
                  icon: Icon(gone ? Icons.arrow_back : Icons.arrow_forward),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LessonPageX()));

                    setState(() {
//                        gone = false;
                      gone = true;
                    });
                  })),
          gone ? test1 : test2
//            gone ? TestUpdateWidget() : TestUpdateWidget()
//            test1
//            TestUpdateWidget()
        ],
      ),
    );
  }

  @override
  void reassemble() {
    super.reassemble();
    print("D1. widget reassemble");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("Z1. widget deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance!.removeObserver(this);
    print("Z2. widget dispose");
  }

  bool isVerifying = false;
  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);

    print(state);

    if (state == AppLifecycleState.resumed && isVerifying == false) {
      isVerifying = true;

      isVerifying = await showDialog(
          builder: (context) => PasswordAlertDialog(),
          context: context,
          barrierDismissible: false);
    }
  }
}

class PasswordAlertDialog extends StatefulWidget {
  @override
  _PasswordAlertDialogState createState() => _PasswordAlertDialogState();
}

class _PasswordAlertDialogState extends State<PasswordAlertDialog> {
  String pwd = "";
  bool isError = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("身份驗證"),
      content: Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            controller: _textEditingController,
            autofocus: true,
            decoration: InputDecoration(
                labelText: "請輸入密碼", errorText: isError ? "密碼錯誤" : null),
            onChanged: (value) {
              pwd = value;
              setState(() {
                isError = false;
              });
            },
          ))
        ],
      ),
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              if (pwd == "IDLF") {
                Navigator.pop(context, false);
              } else {
                setState(() {
                  _textEditingController.text = "";
                  isError = true;
                });
              }
            }),
      ],
    );
  }
}

class TestUpdateWidget extends StatefulWidget {
  const TestUpdateWidget({
    Key? key,
  });

  @override
  _TestUpdateWidgetState createState() => _TestUpdateWidgetState();
}

class _TestUpdateWidgetState extends State<TestUpdateWidget> {
  @override
  void initState() {
    super.initState();
    print("pls init me~~~ ${context.widget.hashCode}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("pls change me~~~");
  }

  @override
  void didUpdateWidget(covariant TestUpdateWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("pls update me~~~ ${oldWidget.hashCode}");
  }

  @override
  void reassemble() {
    print("pls reassemble me~~~");
    super.reassemble();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  void deactivate() {
    super.deactivate();
    print("pls deactivate me~~~");
  }

  @override
  void dispose() {
    super.dispose();
    print("pls dispose me~~~");
  }
}

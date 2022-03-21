import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

class DevAlert extends StatefulWidget {
  static String routeName = "/dev/alert";
  const DevAlert({Key? key}) : super(key: key);

  @override
  _DevAlertState createState() => _DevAlertState();
}

class _DevAlertState extends State<DevAlert> {
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
        title: Text("alert"),
      ),
      body: CupertinoFullscreenDialogTransitionPage(),
      // body: Column(
      //   children: [
      //     /* Container(
      //       alignment: Alignment.center,
      //       padding: EdgeInsets.symmetric(vertical: 30),
      //       color: colorIconAdd,
      //       child: Text(choosed),
      //     ), */
      //     Expanded(
      //       child: ListView(
      //         children: [
      //           ListTile(
      //             leading:
      //                 new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      //             title: Text('DefaultAlertDialog'),
      //             onTap: () async {
      //               showDialog(
      //                   context: context,
      //                   builder: (_) => DefaultAlertDialog("test"));
      //             },
      //           ),
      //           ListTile(
      //             leading:
      //                 new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      //             title: Text('CupertinoDialog'),
      //             onTap: () async {
      //               showDialog(
      //                   context: context,
      //                   builder: (_) => CupertinoDialog("test"));
      //             },
      //           ),
      //           ListTile(
      //             leading:
      //                 new CircleAvatar(child: Icon(Icons.chrome_reader_mode)),
      //             title: Text('CustomAlertDialog'),
      //             onTap: () async {
      //               showDialog(
      //                   context: context,
      //                   builder: (_) => CustomAlertDialog("test"));
      //             },
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class DefaultAlertDialog extends StatelessWidget {
  String message = "";
  DefaultAlertDialog(
    this.message,
  ); //init

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("DefaultAlertDialog"),
      content: Text(message),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context, false); //要自己dismiss
          },
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}

class CustomAlertDialog extends StatelessWidget {
  String message = "";
  CustomAlertDialog(
    this.message,
  ); //init

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height / 2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
                children: [
                  Text("test"),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text("test"),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoButton(
                      //裝IconButton會壞掉XD
                      child: Text("No~"),
                      onPressed: () {
                        Navigator.pop(context, false); //要自己dismiss
                      },
                    ),
                  ),
                  Expanded(
                    child: CupertinoButton(
                      child: Text("Yes!"),
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      insetPadding: EdgeInsets.all(20),
    );
  }
}

class CupertinoFullDialog extends StatelessWidget {
  String message = "";
  CupertinoFullDialog(
    this.message,
  );
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("CupertinoFullDialog"),
      content: Container(
        // width: getProportionateScreenWidth(context, 200),
        width: MediaQuery.of(context).size.width,
        height: getProportionateScreenHeight(context, 200),
        child: Text(message),
      ),
      actions: <Widget>[
        CupertinoButton(
          //裝IconButton會壞掉XD
          child: Text("No~"),
          onPressed: () {
            Navigator.pop(context, false); //要自己dismiss
          },
        ),
        CupertinoButton(
          child: Text("Yes!"),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}

//First Page
class CupertinoFullscreenDialogTransitionPage extends StatefulWidget {
  @override
  _CupertinoFullscreenDialogTransitionState createState() =>
      _CupertinoFullscreenDialogTransitionState();
}

class _CupertinoFullscreenDialogTransitionState
    extends State<CupertinoFullscreenDialogTransitionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton.filled(
            child: Text("Next Page Cupertino Transition"),
            onPressed: () => Navigator.of(context).push(
              PageRouteBuilder(
                opaque: false,
                pageBuilder: (context, _, __) {
                  return FullDialogPage();
                },
              ),
            ),
          ),
        ],
      )),
    );
  }
}

//Second Page
class FullDialogPage extends StatefulWidget {
  @override
  _FullDialogPageState createState() => _FullDialogPageState();
}

class _FullDialogPageState extends State<FullDialogPage>
    with TickerProviderStateMixin {
  late AnimationController _primary, _secondary;
  late Animation<double> _animationPrimary, _animationSecondary;

  @override
  void initState() {
    //Primaty
    _primary = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationPrimary = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _primary, curve: Curves.easeOut));
    //Secondary
    _secondary =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationSecondary = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _secondary, curve: Curves.easeOut));
    _primary.forward();
    super.initState();
  }

  @override
  void dispose() {
    _primary.dispose();
    _secondary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoFullscreenDialogTransition(
      primaryRouteAnimation: _animationPrimary,
      secondaryRouteAnimation: _animationSecondary,
      linearTransition: false,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          title: Text("Testing"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _primary.reverse();
              Future.delayed(Duration(seconds: 1), () {
                Navigator.of(context).pop();
              });
            },
          ),
        ),
      ),
    );
  }
}

class CupertinoDialog extends StatelessWidget {
  String message = "";
  CupertinoDialog(
    this.message,
  );
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text("CupertinoDialog"),
      content: Container(
        // width: getProportionateScreenWidth(context, 200),
        width: MediaQuery.of(context).size.width,
        height: getProportionateScreenHeight(context, 200),
        child: Text(message),
      ),
      actions: <Widget>[
        CupertinoButton(
          //裝IconButton會壞掉XD
          child: Text("No~"),
          onPressed: () {
            Navigator.pop(context, false); //要自己dismiss
          },
        ),
        CupertinoButton(
          child: Text("Yes!"),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:provider/provider.dart';

class DevProvider extends StatefulWidget {
  static String routeName = "/dev/provider";
  const DevProvider({Key? key}) : super(key: key);

  @override
  _DevProviderState createState() => _DevProviderState();
}

class _DevProviderState extends State<DevProvider> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLogin = false;
  int currentIndex = 0;

  final pages = [
    PushNextPage(Colors.orangeAccent, showAppBar: true),
    PushNextPage(Colors.black12, showAppBar: true),
    PushNextPage(Colors.brown, showAppBar: true),
  ];

  final items = [
    BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "甲"),
    BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "乙"),
    BottomNavigationBarItem(icon: Icon(IcoFontIcons.brandMacOs), label: "丙"),
  ];

  final keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  void initState() {
    super.initState();
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("provider"),
      ),
      body: Column(
        children: [],
      ),
    );
  } */
  @override
  Widget build(BuildContext context) {
    final tabScaffold = CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: items,
        onTap: (idx) {
          if (idx == currentIndex) {
            keys[currentIndex].currentState!.popUntil((route) => route.isFirst);
          }
          currentIndex = idx;
        },
      ),
      tabBuilder: (ctx, idx) {
        return CupertinoTabView(
          navigatorKey: keys[idx],
          builder: (BuildContext context) => CupertinoPageScaffold(
            child: pages[idx],
            //加這個就會回不來...待研究
//              navigationBar: idx != 1 ? null : CupertinoNavigationBar(
//                middle: Text("庫比蒂諾"),
//              ),
          ),
        );
      },
    );

    return MultiProvider(
      child: tabScaffold,
      providers: [ChangeNotifierProvider.value(value: LoginChangeNotifier())],
    );
  }
}

class PushNextPage extends StatefulWidget {
  Color backgroundColor = Colors.white;
  bool showAppBar; // = false; //這邊給預設值沒用...要寫在建構子

  PushNextPage(this.backgroundColor, {this.showAppBar = false});

  @override
  _PushNextPageState createState() => _PushNextPageState();
}

class _PushNextPageState extends State<PushNextPage> {
  bool isLogin = false;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  getCenter(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      alignment: Alignment.center,
      child: CupertinoButton(
        child: Icon(Icons.next_week, size: 40),
        onPressed: () async {
          bool providerIsLogin = context.read<LoginChangeNotifier>().isLogin;
          print("Provider: ${providerIsLogin}");
          if (providerIsLogin) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PopPreviousPage()));
          } else {
            //大概是center這個widget先存起來了所以找不到吧...
            //Scaffold.of(context).showSnackBar( //Scaffold.of() called with a context that does not contain a Scaffold.
            final scaffold = ScaffoldMessenger.of(context);
            setState(
              () {
                scaffold.showSnackBar(
                  SnackBar(
                    content: Text('"只有登入後才可進入下一頁喔 :)"'),
                    action: SnackBarAction(
                      label: 'Cancel',
                      onPressed: () {
                        scaffold.removeCurrentSnackBar();
                      },
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }

  getDrawer(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30, bottom: 16),
            child: Icon(IcoFontIcons.waiterAlt, size: 100),
          ),
          ListTile(
            title: Text(
              isLogin ? "登出" : "登入",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            trailing: Switch(
              value: isLogin,
              onChanged: (isOn) {
                //這句放在setState前面就會壞掉, 也太奇怪了吧....
                //Provider.of<LoginChangeNotifier>(context, listen: false).loginToggle();
                setState(() {
                  isLogin = isOn;
                });
                Provider.of<LoginChangeNotifier>(context, listen: false)
                    .loginToggle();
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: widget.showAppBar ? AppBar(title: Text("瑪提利尤")) : null,
      drawer: widget.showAppBar
          ? SizedBox(width: 200, child: getDrawer(context))
          : null,
      body: getCenter(context),
    );
  }
}

//-

class PopPreviousPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //這樣寫是刷新整頁
    /* context.read<LoginChangeNotifier>().onLogout = () {
      Navigator.pop(context);
    }; */

    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Consumer<LoginChangeNotifier>(
          //用Consumer只刷新這邊
          child: Text("如果登出就會踢回前一頁"),
          builder: (context, LoginChangeNotifier loginModel, widget) {
            loginModel.onLogout = () {
              Navigator.pop(context);
            };
            //這邊return出去的才是最後顯示的widget
            return Row(children: [
              Container(child: widget), //這個widget就是上面的child, child可以保持不重刷
              Text(" :)")
            ], mainAxisAlignment: MainAxisAlignment.center);
          },
        ),
      ),
    );
  }
}

//-

class LoginChangeNotifier with ChangeNotifier {
  //這是原生的interface

  //dart可以getter/setter分開, 但  沒有private...
  //https://stackoverflow.com/questions/55756256/private-setters-in-dart
  //https://stackoverflow.com/questions/17488611/how-to-create-private-variables-in-dart/17488825
  bool _isLogin = false;
  bool get isLogin => _isLogin;
  late VoidCallback onLogin;
  late VoidCallback onLogout;

  loginToggle() {
    print('loginToggle: $_isLogin');
    _isLogin = !_isLogin;
    notifyListeners();
    if (isLogin) {
      // onLogin();
    } else {
      onLogout();
    }
  }
}

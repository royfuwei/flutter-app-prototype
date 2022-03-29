import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DevWebView extends StatefulWidget {
  static String routeName = "/dev/webview";
  const DevWebView({Key? key}) : super(key: key);

  @override
  _DevWebViewState createState() => _DevWebViewState();
}

class _DevWebViewState extends State<DevWebView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  _webviewUrl() {
    var url = "https://www.google.com.tw";
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.amber,
          width: MediaQuery.of(context).size.width,
          child: _webviewUrl(),
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      // backgroundColor: Colors.black,
      elevation: 0,
      leading: Container(),
      leadingWidth: 0,
      title: defaultExpandedAppBarTitle(
        startItems: [
          TextButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Icon(
              Icons.close,
              // size: getProportionateScreenWidth(context, 30),
              color: colorFont02,
            ),
          ),
        ],
        titleItems: [
          Text("WebView"),
        ],
        endItems: [],
      ),
    );
  }
}

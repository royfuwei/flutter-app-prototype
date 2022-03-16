import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DevWebView extends StatefulWidget {
  static String routeName = "dev/webview";
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
}
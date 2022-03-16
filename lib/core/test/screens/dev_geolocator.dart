import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class DevGeoLocator extends StatefulWidget {
  static String routeName = "dev/geolocator";
  const DevGeoLocator({Key? key}) : super(key: key);

  @override
  _DevGeoLocatorState createState() => _DevGeoLocatorState();
}

class _DevGeoLocatorState extends State<DevGeoLocator> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final noEnrolledWording = "未啟用生物辨識";

  final LocalAuthentication _localAuth = LocalAuthentication();
  String _canEvaluatePolicy = "";
  Position? position;

  @override
  void initState() {
    super.initState();
    _checkGeoLocator();
    // _getAvailableBiometrics();
  }

  Future<void> _checkGeoLocator() async {
    LocationPermission requestPermission;
    requestPermission = await Geolocator.checkPermission();
    if (requestPermission == LocationPermission.denied) {
      requestPermission = await Geolocator.requestPermission();
    }

    setState(() {
      _canEvaluatePolicy = requestPermission.name;
    });
  }

  _getGeoLocator() async {
    var requestPermission = await Geolocator.requestPermission();
    if (requestPermission != LocationPermission.denied) {
      var _position = await Geolocator.getCurrentPosition();
      setState(() {
        position = _position;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("geolocator"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            SizedBox(height: 100),
            Text("您的裝置是否可以gps定位：$_canEvaluatePolicy"),
            SizedBox(height: 10),
            TextButton(
              child: Text("取得目前gps"),
              onPressed: () {
                _getGeoLocator();
              },
            ),
            SizedBox(height: 50),
            Column(
              children: [
                Text("latitude: ${position?.latitude}"),
                Text("longitude: ${position?.longitude}"),
                Text("speed: ${position?.speed}"),
                Text("timestamp: ${position?.timestamp}"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

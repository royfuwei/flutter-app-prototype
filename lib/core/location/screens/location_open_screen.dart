import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/core/common/components/default_flow_content.dart';
import 'package:seeks_flutter/core/common/components/default_title.dart';
import 'package:seeks_flutter/core/common/components/status_button.dart';
import 'package:seeks_flutter/core/image/screens/image_picker.dart';
import 'package:seeks_flutter/core/image/screens/image_upload.dart';
import 'package:seeks_flutter/core/notification/screens/notification_open_screen.dart';
import 'package:seeks_flutter/routes.dart';

class LocationOpenScreen extends StatefulWidget {
  static String routeName = "location/open";
  const LocationOpenScreen({Key? key}) : super(key: key);

  @override
  _LocationOpenScreenState createState() => _LocationOpenScreenState();
}

class _LocationOpenScreenState extends State<LocationOpenScreen> {
  bool goNext = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultFlowPage(
        // contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          Padding(
            padding: EdgeInsets.only(
              top: getProportionateScreenHeight(context, 64),
            ),
            child: CircleAvatar(
              child: Icon(Icons.location_on),
            ),
          ),
          DefaultTitle(
            title: "開啟定位服務",
            subTitle: "我們使用定位找尋您附近的約會",
          ),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 0),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "開啟定位",
              isDisabled: goNext,
              press: () {
                routePushNamed(context, NotificationOpenScreen.routeName);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "略過",
              isDisabled: !goNext,
              press: () {
                routePushNamed(context, NotificationOpenScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}

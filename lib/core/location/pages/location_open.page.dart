import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/notification/pages/notification_open.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class LocationOpenPage extends StatefulWidget {
  static String routeName = "/location/open";
  const LocationOpenPage({Key? key}) : super(key: key);

  @override
  _LocationOpenPageState createState() => _LocationOpenPageState();
}

class _LocationOpenPageState extends State<LocationOpenPage> {
  bool goNext = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultFlowPage(
        contentMainAxisAlignment: MainAxisAlignment.start,
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
              press: () async {
                var requestPermission = await Geolocator.requestPermission();
                print("開啟定位 requestPermission: ${requestPermission.name}");
                toRoutesNamed([
                  EntryPage.routeName,
                  NotificationOpenPage.routeName,
                ]);
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
                toRoutesNamed([
                  EntryPage.routeName,
                  NotificationOpenPage.routeName,
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
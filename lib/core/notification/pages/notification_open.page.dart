import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/image/pages/image_upload.page.dart';
import 'package:seeks_app_prototype/infrastructures/fcm/push-notification.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class NotificationOpenPage extends StatefulWidget {
  static String routeName = "/notification/open";
  const NotificationOpenPage({Key? key}) : super(key: key);

  @override
  _NotificationOpenPageState createState() => _NotificationOpenPageState();
}

class _NotificationOpenPageState extends State<NotificationOpenPage> {
  bool goNext = false;

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  asyncInitState() async {
    // var permission = await PushNotificationManager.requestPermission();
    // print("PushNotificationManager permission: ${permission.name}");
  }

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
              child: Icon(Icons.notifications),
            ),
          ),
          DefaultTitle(
            title: "開啟通知",
            subTitle: "約會媒合成功通知與通知收到訊息",
          ),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 0),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "開啟通知",
              isDisabled: goNext,
              press: () {
                _openPushNotification();
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
                  ImageUploadPage.routeName,
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }

  _openPushNotification() async {
    await PushNotificationManager.init();
    toRoutesNamed([
      EntryPage.routeName,
      ImageUploadPage.routeName,
    ]);
  }
}

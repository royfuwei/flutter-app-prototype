import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/image/screens/image_picker.dart';
import 'package:seeks_app_prototype/core/image/screens/image_upload.dart';
import 'package:seeks_app_prototype/routes.dart';

class NotificationOpenScreen extends StatefulWidget {
  static String routeName = "notification/open";
  const NotificationOpenScreen({Key? key}) : super(key: key);

  @override
  _NotificationOpenScreenState createState() => _NotificationOpenScreenState();
}

class _NotificationOpenScreenState extends State<NotificationOpenScreen> {
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
                routePushNamed(context, ImageUploadScreen.routeName);
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
                routePushNamed(context, ImageUploadScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }
}

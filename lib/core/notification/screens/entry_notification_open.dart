import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/core/common/components/default_flow_content.dart';
import 'package:seeks_flutter/core/common/components/default_title.dart';
import 'package:seeks_flutter/core/common/components/status_button.dart';

class EntryNotificationOpen extends StatefulWidget {
  static String routeName = "/entry/notification/open";
  const EntryNotificationOpen({Key? key}) : super(key: key);

  @override
  _EntryNotificationOpenState createState() => _EntryNotificationOpenState();
}

class _EntryNotificationOpenState extends State<EntryNotificationOpen> {
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
              isDisabled: !goNext,
              press: () {},
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
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

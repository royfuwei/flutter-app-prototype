import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/dev/pages/dev_webview.dart';
import 'package:seeks_app_prototype/core/notification/components/notification_body.dart';
import 'package:seeks_app_prototype/core/notification/components/splash_data.dart';
import 'package:seeks_app_prototype/core/notification/widgets/notifi_list_item.widget.dart';
import 'package:seeks_app_prototype/infrastructures/util/keep_alive_wrapper.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NotificationPage extends StatefulWidget {
  static String routeName = "/notification";
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final bool isRead = false;
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Navigator(
      pages: [
        MaterialPage(
          child: Scaffold(
            appBar: appBar(),
            body: body(),
          ),
        ),
      ],
    );
    /* return Scaffold(
      appBar: appBar(),
      body: body(),
    ); */
  }

  body() {
    return NotificationBodyComponent();
  }

  appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text(
        "通知",
        style: TextStyle(
          color: colorFont02,
          fontSize: getProportionateScreenWidth(context, 20),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(
            context,
            16,
          )),
          child: isReadButton(isRead),
        ),
        // VerticalSpacing(
        //   of: 10,
        // ),
      ],
    );
  }

  isReadButton(bool isRead) {
    return TextButton(
      onPressed: () {
        setState(() {
          // 目前沒有效果
          isRead = !isRead;
        });
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      child: Row(
        children: [
          Icon(
            Icons.check,
            color: isRead ? Colors.green : colorFont03,
          ),
          Text(
            "已讀",
            style: TextStyle(
              color: isRead ? Colors.green : colorFont03,
              fontSize: getProportionateScreenWidth(context, 16),
            ),
          ),
        ],
      ),
    );
  }
}

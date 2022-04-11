import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/announcement/components/announ_board.dart';
import 'package:seeks_app_prototype/core/notification/components/notification_listview.dart';
import 'package:seeks_app_prototype/core/notification/controllers/notification.controller.dart';

class NotificationBodyComponent extends StatelessWidget {
  const NotificationBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // color: Colors.amber,
      child: Column(
        children: [
          bodyAnnounBoard(context),
          Expanded(
            child: bodyNotifiListView(context),
          ),
        ],
      ),
    );
  }

  bodyAnnounBoard(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 2.2,
      color: colorBarWhite,
      child: AnnounBoardComponent(),
    );
  }

  bodyNotifiListView(BuildContext context) {
    NotificationController notificationController = Get.put(
      NotificationController(),
    );
    return Obx(
      () => NotificationListViewComponent(
        items: notificationController.notifiItemList,
        onRefresh: notificationController.onRefresh,
        scrollListener: notificationController.scrollListener,
        enableCupertinoActivityIndicator:
            notificationController.enableCupertinoActivityIndicator,
      ),
    );
  }
}

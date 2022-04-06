import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';

class SignUpPushNotificationBodyComponent extends StatelessWidget {
  const SignUpPushNotificationBodyComponent({
    Key? key,
    this.goNext = false,
    // this.goNextTitle = "略過",
    this.goNextTitle = "下一步",
    this.notificationPermission = true,
    this.notificationPermissionTitle = "開啟通知",
    this.goNextOnPressed,
    this.notificationPermissionOnPressed,
  }) : super(key: key);

  final bool goNext;
  final String goNextTitle;
  final bool notificationPermission;
  final String notificationPermissionTitle;
  final void Function()? goNextOnPressed;
  final void Function()? notificationPermissionOnPressed;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return Container(
      child: DefaultFlowPage(
        contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          _contentTitleIcon(context),
          _contentTitle(context),
        ],
        buttom: [
          _bottomSettingNotification(
            context,
            notificationPermission,
            notificationPermissionOnPressed,
            notificationPermissionTitle,
          ),
          _bottomPassSettingNotification(
            context,
            goNext,
            goNextOnPressed,
            goNextTitle,
          ),
        ],
      ),
    );
  }

  _contentTitleIcon(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: getProportionateScreenHeight(context, 64),
      ),
      child: CircleAvatar(
        child: Icon(Icons.notifications),
      ),
    );
  }

  _contentTitle(BuildContext context) {
    return DefaultTitle(
      title: "開啟通知",
      subTitle: "約會媒合成功通知與通知收到訊息",
    );
  }
}

_bottomSettingNotification(
  BuildContext context,
  bool _notificationPermission,
  void Function()? _notificationPermissionOnPressed,
  String _notificationPermissionTitle,
) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: getProportionateScreenHeight(context, 24),
    ),
    child: StatusButton(
      text: _notificationPermissionTitle,
      isDisabled: !_notificationPermission,
      press: _notificationPermissionOnPressed,
    ),
  );
}

_bottomPassSettingNotification(
  BuildContext context,
  bool _goNext,
  void Function()? _goNextOnPressed,
  String _goNextTitle,
) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: getProportionateScreenHeight(context, 24),
    ),
    child: StatusButton(
      text: _goNextTitle,
      isDisabled: !_goNext,
      press: _goNextOnPressed,
    ),
  );
}

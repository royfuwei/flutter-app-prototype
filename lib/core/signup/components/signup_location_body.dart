import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';

class SignUpLocationBodyComponent extends StatelessWidget {
  const SignUpLocationBodyComponent({
    Key? key,
    this.goNext = false,
    // this.goNextTitle = "略過",
    this.goNextTitle = "下一步",
    this.locationPermission = true,
    this.locationPermissionTitle = "開啟定位",
    this.goNextOnPressed,
    this.locationPermissionOnPressed,
  }) : super(key: key);

  final bool goNext;
  final String goNextTitle;
  final bool locationPermission;
  final String locationPermissionTitle;
  final void Function()? goNextOnPressed;
  final void Function()? locationPermissionOnPressed;

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
          _bottomSettingLocation(
            context,
            locationPermission,
            locationPermissionOnPressed,
            locationPermissionTitle,
          ),
          _bottomPassSettingLocation(
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
        child: Icon(Icons.location_on),
      ),
    );
  }

  _contentTitle(BuildContext context) {
    return DefaultTitle(
      title: "開啟定位服務",
      subTitle: "我們使用定位找尋您附近的約會",
    );
  }
}

_bottomSettingLocation(
  BuildContext context,
  bool _locationPermission,
  void Function()? _locationPermissionOnPressed,
  String _locationPermissionTitle,
) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: getProportionateScreenHeight(context, 24),
      // horizontal: getProportionateScreenWidth(context, 100),
    ),
    child: StatusButton(
      text: _locationPermissionTitle,
      isDisabled: !_locationPermission,
      press: _locationPermissionOnPressed,
    ),
  );
}

_bottomPassSettingLocation(
  BuildContext context,
  bool _goNext,
  void Function()? _goNextOnPressed,
  String _goNextTitle,
) {
  return Padding(
    padding: EdgeInsets.only(
      bottom: getProportionateScreenHeight(context, 24),
      // horizontal: getProportionateScreenWidth(context, 100),
    ),
    child: StatusButton(
      text: _goNextTitle,
      isDisabled: !_goNext,
      press: _goNextOnPressed,
    ),
  );
}

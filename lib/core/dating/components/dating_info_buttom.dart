import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';

class DatingInfoButtomComponent extends StatelessWidget {
  const DatingInfoButtomComponent({
    Key? key,
    this.title = "加入約會",
    this.isDisabled = false,
    this.onPressed,
  }) : super(key: key);
  final String title;
  final bool isDisabled;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return bodyBottomButton(context);
  }

  bodyBottomButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 8),
        horizontal: getProportionateScreenHeight(context, 16),
      ),
      child: Container(
        child: StatusButton(
          text: title,
          isDisabled: isDisabled,
          press: onPressed,
        ),
      ),
    );
  }
}

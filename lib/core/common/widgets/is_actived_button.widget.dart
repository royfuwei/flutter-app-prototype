import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

isActivedTextButtonWidget({
  required BuildContext context,
  void Function()? onPressed,
  bool isActived = false,
  String text = "",
  Color activeColor = Colors.blue,
  Color inactiveColor = colorFont03,
}) {
  return TextButton(
    onPressed: isActived ? onPressed : () {},
    child: Row(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isActived ? activeColor : inactiveColor,
            fontSize: getProportionateScreenWidth(context, 18),
          ),
        ),
      ],
    ),
  );
}

isActivedIconTextButtonWidget({
  required BuildContext context,
  void Function()? onPressed,
  bool isActived = false,
  IconData? icon,
  String text = "",
  Color activeColor = Colors.blue,
  Color inactiveColor = colorFont03,
}) {
  return TextButton(
    onPressed: isActived ? onPressed : () {},
    child: Row(
      children: [
        Icon(
          icon,
          color: isActived ? activeColor : inactiveColor,
        ),
        Text(
          text,
          style: TextStyle(
            color: isActived ? activeColor : inactiveColor,
            fontSize: getProportionateScreenWidth(context, 18),
          ),
        ),
      ],
    ),
  );
}

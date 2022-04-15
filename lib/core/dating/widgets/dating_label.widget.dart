import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';

class DatingLabelWidget extends StatelessWidget {
  const DatingLabelWidget({
    Key? key,
    required this.title,
    required this.icon,
    this.iconColor = colorFont02,
    this.iconSize = 16,
    this.textStyle,
  }) : super(key: key);

  final IconData icon;
  final Color iconColor;
  final String title;
  final double? iconSize;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(right: 3),
          child: Icon(
            icon,
            size: iconSize,
            color: iconColor,
          ),
        ),
        Text(
          title,
          style: textStyle,
        ),
      ],
    );
  }
}

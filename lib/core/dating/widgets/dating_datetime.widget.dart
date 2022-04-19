import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';

class DatingDateTimeWidget extends StatelessWidget {
  const DatingDateTimeWidget({
    Key? key,
    this.datingWeek = "週日",
    this.datingDate = "6月27日",
    this.datingRange = "14:00 - 17:00",
    this.deadlineWeek = "週日",
    this.deadlineDate = "6月27日",
    this.deadlineTime = "13:00",
    this.color = colorFont02,
  }) : super(key: key);

  final String datingWeek;
  final String datingDate;
  final String datingRange;
  final String deadlineWeek;
  final String deadlineDate;
  final String deadlineTime;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    String deadlineTitle = "最晚審核時間";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            "${datingWeek}, ${datingDate} ${datingRange}",
            style: TextStyle(
              color: color,
            ),
          ),
        ),
        Container(
          child: Text(
            "${deadlineTitle} ${deadlineWeek}, ${deadlineDate} ${deadlineTime}",
            style: TextStyle(
              color: color,
            ),
          ),
        )
      ],
    );
  }
}

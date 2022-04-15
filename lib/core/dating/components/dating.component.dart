import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_label.widget.dart';

getDatingLabelWidget({String title = "", required IconData icon}) {
  return Container(
    padding: EdgeInsets.only(right: 0),
    child: DatingLabelWidget(
      icon: icon,
      title: title,
    ),
  );
}

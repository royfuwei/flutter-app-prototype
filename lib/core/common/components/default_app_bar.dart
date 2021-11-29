import 'package:flutter/material.dart';

defaultAppBarTitle({
  List<Widget> startItems = const <Widget>[],
  List<Widget> titleItems = const <Widget>[],
  List<Widget> endItems = const <Widget>[],
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Row(
        children: startItems,
      ),
      Row(
        children: titleItems,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.end,
        children: endItems,
      )
    ],
  );
}

import 'package:flutter/material.dart';

defaultAppBarTitle({
  startItems = const <Widget>[],
  titleItems = const <Widget>[],
  endItems = const <Widget>[],
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

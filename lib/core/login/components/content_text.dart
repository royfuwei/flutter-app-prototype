import 'package:flutter/material.dart';
import 'package:seeks_flutter/constants.dart';

TextStyle loginTextStyle({double? fontSize = 15}) {
  return TextStyle(
    color: seeksLoginColor01,
    fontFamily: 'Jaldi',
    fontSize: fontSize,
    letterSpacing: -0.30000001192092896,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
}

TextStyle linkTextStyle({double? fontSize = 13}) {
  return TextStyle(
    color: seeksLoginColor01,
    decoration: TextDecoration.underline,
    fontFamily: 'Jaldi',
    fontSize: fontSize,
    letterSpacing: -0.30000001192092896,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );
}

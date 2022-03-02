import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// const bgMainColor = Color.fromRGBO(180, 253, 155, 1);
// const bgMainColor = Color.fromRGBO(240, 243, 255, 1);
// const bgMainColor = Color.fromRGBO(250, 253, 155, 1);
// const bgMainColor = Color.fromRGBO(230, 253, 225, 1);
// const bgMainColor = Color.fromRGBO(240, 250, 245, 1);
const bgMainColor = Color.fromRGBO(250, 250, 245, 1);

Image seeksLogo = Image.asset("assets/logo/seeks_logo.png");
const Color seeksLoginColor01 = Color.fromRGBO(64, 64, 64, 1);
const Color colorIconWhite = Color.fromRGBO(255, 255, 255, 1);
const Color colorBarWhite = Color.fromRGBO(250, 248, 248, 1);
const Color colorFont03 = Color.fromRGBO(139, 139, 139, 1);
const Color colorFont02 = Color.fromRGBO(89, 89, 89, 1);
const Color colorIconHidden = Color.fromRGBO(216, 213, 213, 1);
const Color colorIconOn = Color.fromRGBO(180, 253, 155, 1);
const Color colorIconAdd = Color.fromRGBO(254, 224, 138, 1);

const kPrimaryColor = Color(0xFF3E4067);
const kPrimaryLightColor = Color(0xFF3E5067);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

// Form Error
String pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

final RegExp emailValidatorRegExp = new RegExp(pattern);

const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPasswordNullError = "Please Enter your password";
const String kShortPasswordError = "Password is too short";
const String kMatchPasswordError = "Passwords don't match";
const String kNameNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

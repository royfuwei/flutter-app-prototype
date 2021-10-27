import 'package:flutter/material.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/configs/size_config.dart';

class NoAccountText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account? ",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(context, 16),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            "Sign Up",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(context, 16),
              decoration: TextDecoration.underline,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

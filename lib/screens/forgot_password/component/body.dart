import 'package:flutter/material.dart';
import 'package:seeks_flutter/components/no_account_text.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/screens/forgot_password/component/forgot_password_form.dart';
import 'package:seeks_flutter/configs/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(25),
        ),
        child: Column(
          children: [
            VerticalSpacing(
              of: 30,
            ),
            Text(
              "Fotgot Password",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            VerticalSpacing(
              of: 16,
            ),
            Text(
              "Please enter your email and we will send you a link to return to your account",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: kTextColor,
                height: 1.5,
                fontSize: getProportionateScreenWidth(16),
              ),
            ),
            VerticalSpacing(
              of: 25,
            ),
            ForgetPasswordForm(),
            VerticalSpacing(
              of: 25,
            ),
            NoAccountText(),
            VerticalSpacing(
              of: 25,
            )
          ],
        ),
      ),
    );
  }
}

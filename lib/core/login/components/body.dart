import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:seeks_app_prototype/core/common/components/no_account_text.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/login/components/login_form.dart';
import 'package:seeks_app_prototype/core/login/screens/login_screen.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/routes.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(context, 25),
      ),
      child: Column(
        children: [
          VerticalSpacing(
            of: 30,
          ),
          Text(
            "Welcome to Travel Note",
            style: TextStyle(
              color: Colors.black,
              fontSize: getProportionateScreenWidth(context, 24),
              fontWeight: FontWeight.bold,
            ),
          ),
          VerticalSpacing(of: 16),
          Text(
            "Login with your email and password \nor countinue with social media",
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kTextColor,
              height: 1.5,
              fontSize: getProportionateScreenWidth(context, 16),
            ),
          ),
          VerticalSpacing(
            of: 25,
          ),
          LoginForm(),
          VerticalSpacing(
            of: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.fromString("google"),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  MdiIcons.fromString("facebook"),
                ),
              ),
              IconButton(
                onPressed: () {
                  routePushNamedAndRemoveUntil(context, DevRoutes.home);
                },
                icon: Icon(
                  MdiIcons.fromString("twitter"),
                ),
              ),
            ],
          ),
          VerticalSpacing(
            of: 25,
          ),
          NoAccountText(),
          VerticalSpacing(
            of: 25,
          ),
        ],
      ),
    );
  }
}

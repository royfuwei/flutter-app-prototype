import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/common/components/default_button.dart';
import 'package:seeks_flutter/core/login/components/content_text.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'loginScreen';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgMainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            VerticalSpacing(of: 150),
            titleContent(),
            VerticalSpacing(of: 250),
            loginRegistButton(),
            buttomContent(),
          ],
        ),
      ),
    );
  }

  Widget loginRegistButton() {
    return Padding(
      padding: EdgeInsets.all(
        getProportionateScreenWidth(context, 65),
      ),
      child: DefaultButton(
        text: "登入/註冊",
        press: () {},
        color: seeksLoginColor01,
        bgButtonColor: colorIconWhite,
      ),
    );
  }

  Widget buttomContent() {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(context, 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(
            //   "登入即表明您同意我們的 使用條約 和 隱私政策",
            //   style: loginTextStyle(fontSize: 12),
            // ),
            Text(
              "登入即表明您同意我們的",
              style: loginTextStyle(fontSize: 12),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "使用條約",
                style: linkTextStyle(fontSize: 13),
              ),
            ),
            Text(
              "和",
              style: loginTextStyle(fontSize: 12),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "隱私政策",
                style: linkTextStyle(fontSize: 13),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextButton(
            //       onPressed: () {},
            //       child: Text("使用條約"),
            //     ),
            //     TextButton(
            //       onPressed: () {},
            //       child: Text("隱私政策"),
            //     ),
            //   ],
            // ),
          ],
        ));
  }

  Widget titleContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: seeksLogo,
          ),
          Column(
            children: [
              Text(
                "登入並享受你的全新交友旅程",
                textAlign: TextAlign.center,
                style: loginTextStyle(),
              ),
              Text(
                "尋找你在世界上另一半的靈魂",
                textAlign: TextAlign.center,
                style: loginTextStyle(),
              ),
            ],
          )
        ],
      ),
    );
  }
}

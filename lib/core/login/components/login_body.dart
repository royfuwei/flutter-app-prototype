import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_button.dart';
import 'package:seeks_app_prototype/core/login/components/content_text.dart';

class LoginBodyComponent extends StatefulWidget {
  const LoginBodyComponent({
    Key? key,
    this.onPressedLoginRegister,
    this.onPressedContract,
    this.onPressedPrivacy,
  }) : super(key: key);

  final void Function()? onPressedLoginRegister;
  final void Function()? onPressedContract;
  final void Function()? onPressedPrivacy;

  @override
  State<LoginBodyComponent> createState() => _LoginBodyComponentState();
}

class _LoginBodyComponentState extends State<LoginBodyComponent> {
  bool startAnimation = false;
  bool startAnimationTitle = false;
  int startAnimationTitleDurationMill = 5000;
  late Timer periodicTimer;

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  @override
  void dispose() {
    super.dispose();
    periodicTimer.cancel();
  }

  /// initState async 相關function
  asyncInitState() async {
    await delayAnimation();
  }

  /// login 過度動畫
  delayAnimation() async {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        startAnimation = true;
      });
      periodicTimer = Timer.periodic(
          Duration(
            milliseconds: startAnimationTitleDurationMill,
          ), (timer) {
        setState(() {
          startAnimationTitle = !startAnimationTitle;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return body();
  }

  SafeArea body() {
    return SafeArea(
      child: GestureDetector(
        child: AnimatedOpacity(
          opacity: startAnimation ? 1.0 : 0.0,
          duration: const Duration(
            milliseconds: 3000,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              VerticalSpacing(of: MediaQuery.of(context).size.height * 0.18),
              Expanded(
                child: bodyLogo(),
              ),
              bodyBottom(),
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyLogo() {
    return Container(
      child: Column(
        children: [
          logoImage(),
          logoContent(),
        ],
      ),
    );
  }

  Widget logoImage() {
    return SizedBox(
      height: getProportionateScreenHeight(context, 95),
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: startAnimationTitleDurationMill,
        ),
        width: startAnimationTitle
            ? MediaQuery.of(context).size.width - 30
            : MediaQuery.of(context).size.width,
        child: seeksLogo,
      ),
    );
  }

  Widget logoContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
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

  Widget bodyBottom() {
    return Column(
      children: [
        bottomLoginRegistButton(),
        buttomContent(),
      ],
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
          Text(
            "登入即表明您同意我們的",
            style: loginTextStyle(fontSize: 12),
          ),
          TextButton(
            onPressed: widget.onPressedContract,
            child: Text(
              "使用條約",
              style: linkTextStyle(fontSize: 14),
            ),
          ),
          Text(
            "和",
            style: loginTextStyle(fontSize: 12),
          ),
          TextButton(
            onPressed: widget.onPressedPrivacy,
            child: Text(
              "隱私政策",
              style: linkTextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomLoginRegistButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 40),
        horizontal: getProportionateScreenWidth(context, 48),
      ),
      child: DefaultButton(
        text: "登入/註冊",
        press: widget.onPressedLoginRegister,
        color: colorLoginButtonFont,
        bgButtonColor: colorLoginButton,
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/common/components/default_flow_content.dart';
import 'package:seeks_flutter/core/common/components/default_title.dart';
import 'package:seeks_flutter/core/common/components/status_button.dart';

class CaptchaScreen extends StatefulWidget {
  static String routeName = "captcha";
  const CaptchaScreen({Key? key}) : super(key: key);

  @override
  _CaptchaScreenState createState() => _CaptchaScreenState();
}

class _CaptchaScreenState extends State<CaptchaScreen> {
  late FocusNode focusNode;
  late Timer _timer;
  String telephone = '0966000996';
  String captcha = '';
  int _counter = 60;
  bool goNext = false;

  @override
  void initState() {
    super.initState();
    startTimer();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        focusNode.unfocus();
      },
      child: DefaultFlowPage(
        content: [
          DefaultTitle(title: "輸入驗證碼", subTitle: "驗證碼已發至$telephone"),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                textFieldSide(),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                captchaTitle(),
                reCaptchaButtom(),
              ],
            ),
          ),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "下一步",
              isDisabled: !goNext,
              press: () {},
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      if (_counter == 0) {
        setState(() {
          _timer.cancel();
        });
      } else {
        setState(() {
          _counter--;
        });
      }
    });
  }

  captchaTitle() {
    return Text(
      "${_counter}s 可重新傳送驗證碼",
      style: TextStyle(
        fontSize: getProportionateScreenWidth(context, 18),
        color: goNext ? colorFont03 : colorFont02,
      ),
    );
  }

  reCaptchaButtom() {
    return SizedBox(
      height: getProportionateScreenHeight(context, 40),
      child: TextButton(
        onPressed: _counter > 0
            ? null
            : () {
                setState(() {
                  _counter = 60;
                  startTimer();
                });
              },
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        child: Text(
          "重新傳送",
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontSize: getProportionateScreenWidth(context, 18),
            color: _counter > 0 ? colorFont03 : colorFont02,
          ),
        ),
      ),
    );
  }

  textFieldSide() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(context, 48),
        child: Card(
          elevation: 0.0,
          color: kPrimaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ), //设置圆角
          child: TextField(
            keyboardType: TextInputType.number,
            focusNode: focusNode,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.center,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  captcha = value;
                  if (captcha.length == 6) {
                    goNext = true;
                  } else {
                    goNext = false;
                  }
                });
              } else {
                setState(() {
                  captcha = '';
                });
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "輸入驗證碼",
              hintStyle: TextStyle(
                fontSize: getProportionateScreenWidth(
                  context,
                  18,
                ),
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
            ),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(
                context,
                18,
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/login/controllers/login_status_controller.dart';
import 'package:seeks_app_prototype/core/users/pages/user_create.page.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class CaptchaPage extends StatefulWidget {
  static String routeName = "/captcha";
  const CaptchaPage({Key? key}) : super(key: key);

  @override
  _CaptchaPageState createState() => _CaptchaPageState();
}

class _CaptchaPageState extends State<CaptchaPage> {
  late FocusNode focusNode;
  late Timer _timer;
  String telephone = '';
  String captcha = '';
  int _counter = 60;
  bool goNext = false;

  final LoginStatusController loginStatusController =
      Get.put(LoginStatusController());

  @override
  void initState() {
    super.initState();
    startTimer();
    focusNode = FocusNode();
    getStatusModel();
  }

  getStatusModel() async {
    var result = await loginStatusController.getLocalStorage();
    setState(() {
      telephone = result.telephone;
    });
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
          Expanded(
            child: Column(
              children: [
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
            ),
          )
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
              press: () {
                toRoutesNamed([
                  EntryPage.routeName,
                  UserCreatePage.routeName,
                ]);
              },
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/captcha/components/captcha_tel_textfield.dart';
import 'package:seeks_app_prototype/core/captcha/controllers/captcha.controller.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';

class CaptchaTelBodyComponent extends StatefulWidget {
  const CaptchaTelBodyComponent({
    Key? key,
    this.telephone = "",
    this.counter = 60,
    this.goNextOnPressed,
    // this.fieldCaptchOnChanged,
  }) : super(key: key);

  final String telephone;
  final int counter;
  final void Function()? goNextOnPressed;
  // final void Function(String)? fieldCaptchOnChanged;

  @override
  State<CaptchaTelBodyComponent> createState() =>
      _CaptchaTelBodyComponentState();
}

class _CaptchaTelBodyComponentState extends State<CaptchaTelBodyComponent> {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  CaptchaController captchaController = Get.put(CaptchaController());

  late Timer _timer;
  late int _counter = widget.counter;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  @override
  void initState() {
    startTimer();
    super.initState();
    captchaController.initCaptchaTelPage(
      widget.telephone,
      textEditingController,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    focusNode.dispose();
    textEditingController.dispose();
    super.dispose();
  }

  body() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        focusNode.unfocus();
      },
      child: DefaultFlowPage(
        contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          Obx(
            () => _contentTitle(
              telephone: captchaController.telephone,
            ),
          ),
          _contentBody(),
        ],
        buttom: [
          Obx(
            () => _bottomContent(
              goNext: captchaController.goNext,
            ),
          ),
        ],
      ),
    );
  }

  _contentTitle({
    String telephone = "",
  }) {
    return DefaultTitle(
      title: "輸入驗證碼",
      subTitle: "驗證碼已發至${telephone}",
    );
  }

  _contentBody() {
    return Expanded(
      child: Column(
        children: [
          textFieldSide(),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => _captchaTitle(
                    goNext: captchaController.goNext,
                  ),
                ),
                _reCaptchaButtom(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _captchaTitle({
    bool goNext = false,
  }) {
    return Text(
      "${_counter}s 可重新傳送驗證碼",
      style: TextStyle(
        fontSize: getProportionateScreenWidth(context, 18),
        color: goNext ? colorFont03 : colorFont02,
      ),
    );
  }

  _reCaptchaButtom() {
    return SizedBox(
      height: getProportionateScreenHeight(context, 40),
      child: TextButton(
        onPressed: _counter > 0 ? null : _reCaptchaOnPressed,
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
            color: _counter > 0 ? colorFont03 : Colors.amber,
          ),
        ),
      ),
    );
  }

  _reCaptchaOnPressed() async {
    await captchaController.reCaptchaOnPressed();
    _counter = widget.counter;
    // _counter = 5;
    startTimer();
    setState(() {});
  }

  _bottomContent({
    bool goNext = false,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: StatusButton(
        text: "下一步",
        isDisabled: !goNext,
        press: widget.goNextOnPressed,
      ),
    );
  }

  textFieldSide() {
    return CaptchaTelTextFieldComponent(
      focusNode: focusNode,
      textEditingController: textEditingController,
      fieldCaptchOnChanged: captchaController.captchaFieldOnChanged,
    );
  }

  startTimer() {
    const oneSec = const Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (timer) {
      if (_counter == 0) {
        _timer.cancel();
      } else {
        _counter--;
        setState(() {});
      }
    });
  }
}

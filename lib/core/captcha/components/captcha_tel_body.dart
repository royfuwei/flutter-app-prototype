import 'dart:async';

import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';

class CaptchaTelBodyComponent extends StatefulWidget {
  const CaptchaTelBodyComponent({
    Key? key,
    this.telephone = "",
    this.counter = 60,
    this.goNext = false,
    this.reCaptchaOnPressed,
    this.goNextOnPressed,
    this.fieldCaptchOnChanged,
  }) : super(key: key);

  final String telephone;
  final int counter;
  final bool goNext;
  final void Function()? reCaptchaOnPressed;
  final void Function()? goNextOnPressed;
  final void Function(String)? fieldCaptchOnChanged;

  @override
  State<CaptchaTelBodyComponent> createState() =>
      _CaptchaTelBodyComponentState();
}

class _CaptchaTelBodyComponentState extends State<CaptchaTelBodyComponent> {
  FocusNode focusNode = FocusNode();

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
  }

  @override
  void dispose() {
    _timer.cancel();
    focusNode.dispose();
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
          _contentTitle(),
          _contentBody(),
        ],
        buttom: [
          _bottomContent(),
        ],
      ),
    );
  }

  _contentTitle() {
    return DefaultTitle(
      title: "輸入驗證碼",
      subTitle: "驗證碼已發至${widget.telephone}",
    );
  }

  _contentBody() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _textFieldSide(),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _captchaTitle(),
                _reCaptchaButtom(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _captchaTitle() {
    return Text(
      "${_counter}s 可重新傳送驗證碼",
      style: TextStyle(
        fontSize: getProportionateScreenWidth(context, 18),
        color: widget.goNext ? colorFont03 : colorFont02,
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

  _reCaptchaOnPressed() {
    setState(() {
      if (widget.reCaptchaOnPressed != null) {
        widget.reCaptchaOnPressed!();
      }
      _counter = widget.counter;
      // _counter = 5;
      startTimer();
    });
  }

  _bottomContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: StatusButton(
        text: "下一步",
        isDisabled: !widget.goNext,
        press: widget.goNextOnPressed,
      ),
    );
  }

  _textFieldSide() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(context, 48),
        child: Card(
          elevation: 0.0,
          color: colorTextField,
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
            onChanged: widget.fieldCaptchOnChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "輸入驗證碼",
              hintStyle: TextStyle(
                fontSize: getProportionateScreenWidth(
                  context,
                  18,
                ),
                color: Colors.white60,
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

  startTimer() {
    const oneSec = const Duration(seconds: 1);

    _timer = Timer.periodic(oneSec, (timer) {
      print("_counter: ${_counter}");
      if (_counter == 0) {
        _timer.cancel();
      } else {
        _counter--;
        setState(() {});
      }
    });
  }
}

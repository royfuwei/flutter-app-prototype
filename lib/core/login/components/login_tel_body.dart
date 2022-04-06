import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';

class LoginTelBodyComponent extends StatefulWidget {
  const LoginTelBodyComponent({
    Key? key,
    this.fieldTelOnChanged,
    this.areaCodeOnPressed,
    this.goNextOnPressed,
    this.areaCode = "+886",
    this.goNext = false,
  }) : super(key: key);

  final void Function(String)? fieldTelOnChanged;
  final void Function()? areaCodeOnPressed;
  final void Function()? goNextOnPressed;
  final String areaCode;
  final bool goNext;

  @override
  State<LoginTelBodyComponent> createState() => _LoginTelBodyComponentState();
}

class _LoginTelBodyComponentState extends State<LoginTelBodyComponent> {
  FocusNode focusNode = FocusNode();
  String telephone = '';
  bool goNext = false;

  @override
  Widget build(BuildContext context) {
    return body();
  }

  @override
  dispose() {
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
      title: "準備來個不一樣的約會嗎？",
      subTitle: "請輸入手機號碼",
    );
  }

  _contentBody() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _contentAreaCodeButtom(),
          _contentTextFieldSide(),
        ],
      ),
    );
  }

  _bottomContent() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: StatusButton(
        text: "取得驗證碼",
        isDisabled: !widget.goNext,
        press: widget.goNextOnPressed,
      ),
    );
  }

  _contentTextFieldSide() {
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
            cursorColor: Colors.white12,
            cursorWidth: 1,
            keyboardType: TextInputType.phone,
            focusNode: focusNode,
            textInputAction: TextInputAction.done,
            onChanged: widget.fieldTelOnChanged,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "填寫手機號碼",
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

  _contentAreaCodeButtom() {
    return SizedBox(
      height: getProportionateScreenHeight(context, 40),
      child: TextButton(
        onPressed: widget.areaCodeOnPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(colorTextField),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            widget.areaCode,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(context, 18),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

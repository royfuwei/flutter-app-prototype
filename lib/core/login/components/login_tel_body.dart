import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/login/components/login_tel_textfield.dart';
import 'package:seeks_app_prototype/core/login/controllers/login_controller.dart';

class LoginTelBodyComponent extends StatefulWidget {
  const LoginTelBodyComponent({
    Key? key,
    this.goNext = false,
  }) : super(key: key);

  final bool goNext;

  @override
  State<LoginTelBodyComponent> createState() => _LoginTelBodyComponentState();
}

class _LoginTelBodyComponentState extends State<LoginTelBodyComponent> {
  FocusNode focusNode = FocusNode();

  TextEditingController textEditingController = TextEditingController();

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return body();
  }

  @override
  void initState() {
    super.initState();
    print("LoginTelBodyComponent initState");
    loginController.initLoginTelPage(
      textEditingController: textEditingController,
    );
  }

  @override
  dispose() {
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
          _contentTitle(),
          _contentBody(),
        ],
        buttom: [
          Obx(
            () => _bottomContent(
              goNext: loginController.loginTelGoNext,
              goNextOnPressed: loginController.loginTelGoNextOnPressed,
            ),
          ),
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
          Container(
            padding: EdgeInsets.only(right: 5),
            child: Obx(
              () => _contentAreaCodeButtom(
                areaCode: loginController.areaCode,
              ),
            ),
          ),
          _contentTextFieldSide(),
        ],
      ),
    );
  }

  _bottomContent({
    bool goNext = false,
    void Function()? goNextOnPressed,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: StatusButton(
        text: "取得驗證碼",
        isDisabled: !goNext,
        press: goNextOnPressed,
      ),
    );
  }

  _contentTextFieldSide() {
    return LoginTelTextFieldComponent(
      focusNode: focusNode,
      fieldTelOnChanged: loginController.loginTelFieldTelOnChanged,
      controller: textEditingController,
    );
  }

  _contentAreaCodeButtom({
    required String areaCode,
    void Function()? areaCodeOnPressed,
  }) {
    return SizedBox(
      height: getProportionateScreenHeight(context, 48),
      child: TextButton(
        onPressed: areaCodeOnPressed,
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
            areaCode,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_account_textfield.dart';
import 'package:seeks_app_prototype/core/signup/controllers/signup_account.controller.dart';

class SignUpAccountComponent extends StatefulWidget {
  const SignUpAccountComponent({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpAccountComponent> createState() => _SignUpAccountComponentState();
}

class _SignUpAccountComponentState extends State<SignUpAccountComponent> {
  SignUpAccountController signUpAccountController = Get.put(
    SignUpAccountController(),
  );
  TextEditingController referralCodeEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return body();
  }

  @override
  void initState() {
    super.initState();
    signUpAccountController.initSignUpAccountPage(
      emailEditingController: emailEditingController,
      referralCodeEditingController: referralCodeEditingController,
    );
  }

  @override
  dispose() {
    super.dispose();
    referralCodeEditingController.dispose();
    emailEditingController.dispose();
    FocusScope.of(context).dispose();
  }

  body() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultFlowPage(
        contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          _contentTitle(),
          Expanded(
            child: _contentBody(),
          ),
        ],
        buttom: [
          Obx(
            () => _bottomContent(
              goNext: signUpAccountController.goNext,
            ),
          ),
        ],
      ),
    );
  }

  _contentBody() {
    return SignUpAccountTextFieldComponent(
      emailOnChanged: signUpAccountController.fieldEmailOnChanged,
      emailEditingController: emailEditingController,
      referralCodeOnChanged: signUpAccountController.fieldReferralCodeOnChanged,
      referralCodeEditingController: referralCodeEditingController,
    );
  }

  _contentTitle() {
    return DefaultTitle(
      title: "建立帳號",
      subTitle: "建立帳號，開始約會吧",
    );
  }

  _bottomContent({
    bool goNext = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: StatusButton(
        text: "建立帳號",
        isDisabled: !goNext,
        press: signUpAccountController.goNextOnPressed,
      ),
    );
  }
}

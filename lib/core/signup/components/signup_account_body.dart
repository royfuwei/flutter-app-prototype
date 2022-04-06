import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/input_text_field.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';

class SignUpAccountComponent extends StatefulWidget {
  const SignUpAccountComponent({
    Key? key,
    this.goNextOnPressed,
    this.fieldEmailOnChanged,
    this.fieldReferralCodeOnChanged,
    this.goNext = false,
  }) : super(key: key);

  final void Function()? goNextOnPressed;
  final void Function(String)? fieldEmailOnChanged;
  final void Function(String)? fieldReferralCodeOnChanged;
  final bool goNext;

  @override
  State<SignUpAccountComponent> createState() => _SignUpAccountComponentState();
}

class _SignUpAccountComponentState extends State<SignUpAccountComponent> {
  // FocusNode focusNode = FocusNode();
  // bool goNext = false;
  // String email = '';
  // String referralCode = '';
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return body();
  }

  @override
  dispose() {
    // focusNode.dispose();
    super.dispose();
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
          _bottomContent(),
        ],
      ),
    );
  }

  _contentBody() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 8),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _contentBodySignUpForm(),
          ],
        ),
      ),
    );
  }

  _contentBodySignUpForm() {
    return Form(
      // key: _formKey,
      child: Column(
        children: [
          InputTextField(
            hintText: "輸入Email",
            title: "Email(不會公開資訊)",
            subTitle: "填寫正確的Email來註冊您的帳號",
            keyboardType: TextInputType.emailAddress,
            onChanged: widget.fieldEmailOnChanged,
          ),
          InputTextField(
            hintText: "填寫推薦碼",
            title: "推薦碼",
            subTitle: "(選填)輸入其他用戶推薦代碼",
            keyboardType: TextInputType.text,
            onChanged: widget.fieldReferralCodeOnChanged,
          ),
        ],
      ),
    );
  }

  _contentTitle() {
    return DefaultTitle(
      title: "建立帳號",
      subTitle: "建立帳號，開始約會吧",
    );
  }

  _bottomContent() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: StatusButton(
        text: "建立帳號",
        isDisabled: !widget.goNext,
        press: widget.goNextOnPressed,
      ),
    );
  }
}

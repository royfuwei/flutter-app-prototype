import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/input_text_field.dart';

class SignUpAccountTextFieldComponent extends StatelessWidget {
  const SignUpAccountTextFieldComponent({
    Key? key,
    this.emailOnChanged,
    this.referralCodeOnChanged,
    this.emailEditingController,
    this.referralCodeEditingController,
  }) : super(key: key);

  final void Function(String)? emailOnChanged;
  final void Function(String)? referralCodeOnChanged;
  final TextEditingController? emailEditingController;
  final TextEditingController? referralCodeEditingController;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return _contentBody(context);
  }

  _contentBody(BuildContext context) {
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
            textEditingController: emailEditingController,
            hintText: "輸入Email",
            title: "Email(不會公開資訊)",
            subTitle: "填寫正確的Email來註冊您的帳號",
            keyboardType: TextInputType.emailAddress,
            onChanged: emailOnChanged,
          ),
          InputTextField(
            textEditingController: referralCodeEditingController,
            hintText: "填寫推薦碼",
            title: "推薦碼",
            subTitle: "(選填)輸入其他用戶推薦代碼",
            keyboardType: TextInputType.text,
            onChanged: referralCodeOnChanged,
          ),
        ],
      ),
    );
  }
}

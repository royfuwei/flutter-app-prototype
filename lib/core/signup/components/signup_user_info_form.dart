import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/core/common/components/input_text_field.dart';

class SignUpUserInfoFormComponent extends StatefulWidget {
  const SignUpUserInfoFormComponent({Key? key}) : super(key: key);

  @override
  State<SignUpUserInfoFormComponent> createState() =>
      _SignUpUserInfoFormComponentState();
}

class _SignUpUserInfoFormComponentState
    extends State<SignUpUserInfoFormComponent> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return bodyUserInfoForm();
  }

  bodyUserInfoForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputTextField(
            title: "填寫暱稱",
            hintText: "暱稱",
            subTitle: "用於顯示給其他使用者，之後可以更改",
            keyboardType: TextInputType.emailAddress,
          ),
          InputTextField(
            title: "推薦碼",
            hintText: "填寫生日",
            subTitle: "之後不能更改",
            keyboardType: TextInputType.text,
          ),
          InputTextField(
            title: "性別",
            hintText: "選擇性別",
            subTitle: "之後不能更改",
            keyboardType: TextInputType.text,
          ),
          InputTextField(
            title: "你喜歡？",
            hintText: "擇你所愛",
            subTitle: "之後可以更改",
            keyboardType: TextInputType.text,
          ),
          InputTextField(
            title: "居住地",
            hintText: "填寫居住地",
            subTitle: "",
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}

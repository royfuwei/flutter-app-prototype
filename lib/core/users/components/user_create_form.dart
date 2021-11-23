import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/common/components/input_text_field.dart';

class UserCreateForm extends StatefulWidget {
  const UserCreateForm({
    Key? key,
  }) : super(key: key);

  @override
  _UserCreateFormState createState() => _UserCreateFormState();
}

class _UserCreateFormState extends State<UserCreateForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputTextField(
            hintText: "輸入Email",
            title: "Email(不會公開資訊)",
            subTitle: "填寫正確的Email來註冊您的帳號",
            keyboardType: TextInputType.emailAddress,
          ),
          InputTextField(
            hintText: "填寫推薦碼",
            title: "推薦碼",
            subTitle: "(選填)輸入其他用戶推薦代碼",
            keyboardType: TextInputType.text,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/input_text_field.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/location/screens/location_open_screen.dart';
import 'package:seeks_app_prototype/core/users/components/user_create_form.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_create_controller.dart';
import 'package:seeks_app_prototype/routes.dart';

class UserCreateScreen extends StatefulWidget {
  static String routeName = "user/create";
  const UserCreateScreen({Key? key}) : super(key: key);

  @override
  _UserCreateScreenState createState() => _UserCreateScreenState();
}

class _UserCreateScreenState extends State<UserCreateScreen> {
  late FocusNode focusNode;
  bool goNext = false;
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String referralCode = '';

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  final UserCreateController userCreateController =
      Get.put(UserCreateController());
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: DefaultFlowPage(
        // contentMainAxisAlignment: MainAxisAlignment.start,
        content: [
          DefaultTitle(
            title: "建立帳號",
            subTitle: "建立帳號，開始約會吧",
          ),
          // UserCreateForm(),
          getUserCreateForm(),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "建立帳號",
              isDisabled: !goNext,
              press: () async {
                var model = await userCreateController.setValue('email', email);
                print("button model.email: ${model.email}");
                routePushNamed(context, LocationOpenScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }

  getUserCreateForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          InputTextField(
            hintText: "輸入Email",
            title: "Email(不會公開資訊)",
            subTitle: "填寫正確的Email來註冊您的帳號",
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              bool goNextStatus = false;
              String thisValue = '';
              if (value.isNotEmpty) {
                thisValue = value;
                if (referralCode.isNotEmpty) {
                  goNextStatus = true;
                }
              }
              setState(() {
                email = thisValue;
                goNext = goNextStatus;
              });
            },
          ),
          InputTextField(
            hintText: "填寫推薦碼",
            title: "推薦碼",
            subTitle: "(選填)輸入其他用戶推薦代碼",
            keyboardType: TextInputType.text,
            onChanged: (value) {
              bool goNextStatus = false;
              String thisValue = '';
              if (value.isNotEmpty) {
                thisValue = value;
                if (email.isNotEmpty) {
                  goNextStatus = true;
                }
              }
              setState(() {
                referralCode = thisValue;
                goNext = goNextStatus;
              });
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/signup/components/signup_user_info_form.dart';

class SignUpUserInfoBodyComponent extends StatefulWidget {
  const SignUpUserInfoBodyComponent({Key? key}) : super(key: key);

  @override
  State<SignUpUserInfoBodyComponent> createState() =>
      _SignUpUserInfoBodyComponentState();
}

class _SignUpUserInfoBodyComponentState
    extends State<SignUpUserInfoBodyComponent> {
  bool goNext = false;
  @override
  Widget build(BuildContext context) {
    return body();
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
          // VerticalSpacing(of: 25),
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

  _contentTitle() {
    return DefaultTitle(
      title: "填寫個人訊息",
      subTitle: "輸入個人訊息",
    );
  }

  _contentBody() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 8),
      ),
      child: SingleChildScrollView(
        child: SignUpUserInfoFormComponent(),
      ),
    );
  }

  _bottomContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
        // horizontal: getProportionateScreenWidth(context, 100),
      ),
      child: StatusButton(
        text: "完成",
        isDisabled: !goNext,
        press: () {},
      ),
    );
  }
}

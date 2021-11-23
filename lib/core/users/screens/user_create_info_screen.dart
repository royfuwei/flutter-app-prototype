import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/core/common/components/default_flow_content.dart';
import 'package:seeks_flutter/core/common/components/default_title.dart';
import 'package:seeks_flutter/core/common/components/status_button.dart';
import 'package:seeks_flutter/core/users/components/user_create_info_form.dart';

class UserCreateInfoScreen extends StatefulWidget {
  static String routeName = "user/create/info";
  const UserCreateInfoScreen({Key? key}) : super(key: key);

  @override
  _UserCreateInfoScreenState createState() => _UserCreateInfoScreenState();
}

class _UserCreateInfoScreenState extends State<UserCreateInfoScreen> {
  bool goNext = false;

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
            title: "填寫個人訊息",
            subTitle: "輸入個人訊息",
          ),
          UserCreateInfoForm(),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "完成",
              isDisabled: !goNext,
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

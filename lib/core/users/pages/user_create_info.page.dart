import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/users/components/user_create_info_form.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class UserCreateInfoPage extends StatefulWidget {
  static String routeName = "/user/create/info";
  const UserCreateInfoPage({Key? key}) : super(key: key);

  @override
  _UserCreateInfoPageState createState() => _UserCreateInfoPageState();
}

class _UserCreateInfoPageState extends State<UserCreateInfoPage> {
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
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .7,
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                child: UserCreateInfoForm(),
              ),
            ),
          ),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "完成",
              isDisabled: goNext,
              press: () {
                toRoutesNamed([
                  MainPage.routeName,
                ]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

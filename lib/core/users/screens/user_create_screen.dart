import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/common/components/default_flow_content.dart';
import 'package:seeks_flutter/core/common/components/default_title.dart';
import 'package:seeks_flutter/core/common/components/status_button.dart';
import 'package:seeks_flutter/core/users/components/user_create_form.dart';

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

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

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
          UserCreateForm(),
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
              press: () {},
            ),
          ),
        ],
      ),
    );
  }
}

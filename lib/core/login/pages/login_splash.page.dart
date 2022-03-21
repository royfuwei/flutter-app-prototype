import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/captcha/pages/captcha.page.dart';
import 'package:seeks_app_prototype/core/common/components/default_flow_content.dart';
import 'package:seeks_app_prototype/core/common/components/default_page_route.dart';
import 'package:seeks_app_prototype/core/common/components/status_button.dart';
import 'package:seeks_app_prototype/core/common/components/default_title.dart';
import 'package:seeks_app_prototype/core/login/controllers/login_status_controller.dart';
import 'package:seeks_app_prototype/core/login/models/login_status_model.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_status_controller.dart';

class LoginSplashPage extends StatefulWidget {
  static String routeName = '/login/splash';
  const LoginSplashPage({Key? key}) : super(key: key);

  @override
  _LoginSplashPageState createState() => _LoginSplashPageState();
}

class _LoginSplashPageState extends State<LoginSplashPage> {
  late FocusNode focusNode;
  String telephone = '';
  bool goNext = false;

  late LoginStatusModel loginStatusModel;
  final UserStatusController userStatusController =
      Get.put(UserStatusController());
  final LoginStatusController loginStatusController =
      Get.put(LoginStatusController());

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    getStatusModel();
  }

  getStatusModel() async {
    await loginStatusController.clearLocalStorage();
    var result = await loginStatusController.getLocalStorage();
    setState(() {
      loginStatusModel = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        focusNode.unfocus();
      },
      child: DefaultFlowPage(
        content: [
          DefaultTitle(
            title: "準備來個不一樣的約會嗎？",
            subTitle: "請輸入手機號碼",
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                areaCodeButtom(),
                textFieldSide(),
              ],
            ),
          ),
          // Text('telepahone: $telephone'),
        ],
        buttom: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(context, 24),
              // horizontal: getProportionateScreenWidth(context, 100),
            ),
            child: StatusButton(
              text: "取得驗證碼",
              isDisabled: !goNext,
              press: () async {
                var model = await loginStatusController.setValue(
                    'telephone', telephone);
                print("button model.telephone: ${model.telephone}");
                Navigator.of(context).push(DefaultPageRoute(CaptchaPage()));
                // routePushNamed(context, CaptchaScreen.routeName);
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return HomeScreen();
                // }));
                // routePushNamed(context, HomeScreen.routeName);
              },
            ),
          ),
        ],
      ),
    );
  }

  textFieldSide() {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(context, 48),
        child: Card(
          elevation: 0.0,
          color: kPrimaryColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ), //设置圆角
          child: TextField(
            keyboardType: TextInputType.phone,
            focusNode: focusNode,
            textInputAction: TextInputAction.done,
            onChanged: (value) {
              if (value.isNotEmpty) {
                setState(() {
                  telephone = value;
                  if (telephone[0] == '0' && telephone.length == 10) {
                    goNext = true;
                  } else if (telephone[0] != '0' && telephone.length == 9) {
                    goNext = true;
                  } else {
                    goNext = false;
                  }
                });
              } else {
                setState(() {
                  telephone = '';
                });
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "填寫手機號碼",
              hintStyle: TextStyle(
                fontSize: getProportionateScreenWidth(
                  context,
                  18,
                ),
                color: Colors.grey,
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 16,
              ),
            ),
            style: TextStyle(
              fontSize: getProportionateScreenWidth(
                context,
                18,
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  areaCodeButtom() {
    return SizedBox(
      height: getProportionateScreenHeight(context, 40),
      child: TextButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        ),
        child: Text(
          "+886",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(context, 18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

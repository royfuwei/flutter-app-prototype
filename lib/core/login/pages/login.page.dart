import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_button.dart';
import 'package:seeks_app_prototype/core/entry/pages/entry.page.dart';
import 'package:seeks_app_prototype/core/login/components/content_text.dart';
import 'package:seeks_app_prototype/core/login/pages/login_tel.page.dart';
import 'package:seeks_app_prototype/core/main/pages/main.page.dart';
import 'package:seeks_app_prototype/core/users/controllers/user_status_controller.dart';
import 'package:seeks_app_prototype/core/users/models/user_status_model.dart';
import 'package:seeks_app_prototype/infrastructures/util/getx_routes.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool startAnimation = false;
  bool startAnimationTitle = false;
  int startAnimationTitleDurationMill = 5000;
  late Timer periodicTimer;
  late UserStatusModel userStatusModel;

  final UserStatusController controller = Get.put(UserStatusController());
  final UserStatusController findController = Get.find();

  @override
  void initState() {
    super.initState();
    asyncInitState();
  }

  @override
  void dispose() {
    super.dispose();
    periodicTimer.cancel();
  }

  /// initState async 相關function
  asyncInitState() async {
    await delayAnimation();
    await getStatusModel();
  }

  /// login 過度動畫
  delayAnimation() async {
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        startAnimation = true;
      });
      periodicTimer = Timer.periodic(
          Duration(
            milliseconds: startAnimationTitleDurationMill,
          ), (timer) {
        setState(() {
          startAnimationTitle = !startAnimationTitle;
        });
      });
    });
  }

  /// 取得人員狀態
  getStatusModel() async {
    // await controller.clearLocalStorage();
    var result = await controller.getLocalStorage();
    setState(() {
      userStatusModel = result;
    });
    print("getStatusModel userStatusModel.isLogin: ${userStatusModel.isLogin}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgMainColor,
      body: body(),
    );
  }

  body() {
    return SafeArea(
      child: GestureDetector(
        child: AnimatedOpacity(
          opacity: startAnimation ? 1.0 : 0.0,
          duration: const Duration(
            milliseconds: 3000,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              VerticalSpacing(of: MediaQuery.of(context).size.height * 0.18),
              Expanded(
                child: bodyLogo(),
              ),
              bodyBottom(),
            ],
          ),
        ),
      ),
    );
  }

  bodyLogo() {
    return Container(
      child: Column(
        children: [
          logoImage(),
          logoContent(),
        ],
      ),
    );
  }

  logoImage() {
    return SizedBox(
      height: getProportionateScreenHeight(context, 95),
      child: AnimatedContainer(
        duration: Duration(
          milliseconds: startAnimationTitleDurationMill,
        ),
        width: startAnimationTitle
            ? MediaQuery.of(context).size.width - 30
            : MediaQuery.of(context).size.width,
        child: seeksLogo,
      ),
    );
  }

  Widget logoContent() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              Text(
                "登入並享受你的全新交友旅程",
                textAlign: TextAlign.center,
                style: loginTextStyle(),
              ),
              Text(
                "尋找你在世界上另一半的靈魂",
                textAlign: TextAlign.center,
                style: loginTextStyle(),
              ),
            ],
          )
        ],
      ),
    );
  }

  bodyBottom() {
    return Column(
      children: [
        bottomLoginRegistButton(),
        buttomContent(),
      ],
    );
  }

  Widget buttomContent() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(context, 5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "登入即表明您同意我們的",
            style: loginTextStyle(fontSize: 12),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "使用條約",
              style: linkTextStyle(fontSize: 14),
            ),
          ),
          Text(
            "和",
            style: loginTextStyle(fontSize: 12),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              "隱私政策",
              style: linkTextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomLoginRegistButton() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 40),
        horizontal: getProportionateScreenWidth(context, 48),
      ),
      child: DefaultButton(
        text: "登入/註冊",
        press: () {
          print("userStatusModel.isLogin: ${userStatusModel.isLogin}");
          if (userStatusModel.isLogin == true) {
            offRoutesNamed([
              MainPage.routeName,
            ]);
          } else {
            toRoutesNamed([
              EntryPage.routeName,
              LoginTelPage.routeName,
            ]);
          }
        },
        color: colorLoginButtonFont,
        bgButtonColor: colorLoginButton,
      ),
    );
  }
}

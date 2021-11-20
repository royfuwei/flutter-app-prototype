import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/core/common/components/default_button.dart';
import 'package:seeks_flutter/core/common/components/title.dart';
import 'package:seeks_flutter/core/login/components/content_text.dart';

class LoginSplashScreen extends StatefulWidget {
  static String routeName = 'loginSplashScreen';
  const LoginSplashScreen({Key? key}) : super(key: key);

  @override
  _LoginSplashScreenState createState() => _LoginSplashScreenState();
}

class _LoginSplashScreenState extends State<LoginSplashScreen> {
  late FocusNode focusNode;
  String telephone = '';
  bool goNext = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: seeksLoginColor01),
        elevation: 0,
        backgroundColor: colorBarWhite,
      ),
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            dismissKeyboard();
          },
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(context, 24),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTitle(title: "準備來個不一樣的約會嗎？", subTitle: "請輸入手機號碼"),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(context, 24),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(context, 40),
                            child: TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(kPrimaryColor),
                              ),
                              child: Text(
                                "+886",
                                style: TextStyle(
                                  fontSize:
                                      getProportionateScreenWidth(context, 18),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
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
                                        if (telephone[0] == 0 &&
                                            telephone.length == 10) {
                                          goNext = false;
                                        } else if (telephone[0] != 0 &&
                                            telephone.length == 9) {
                                          goNext = false;
                                        } else {
                                          goNext = true;
                                        }
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
                          ),
                        ],
                      ),
                    ),
                    Text('telepahone: $telephone'),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(context, 24),
                      ),
                      child: getButtonByStatus(goNext),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getButtonByStatus(bool isDisabled) {
    if (isDisabled) {
      return DefaultButton(
        text: "取得驗證碼",
        press: null,
        color: colorFont03,
        bgButtonColor: colorIconHidden,
        isElevation: false,
      );
    }
    return DefaultButton(
      text: "取得驗證碼",
      press: () {},
      color: colorFont02,
      bgButtonColor: colorIconOn,
      isElevation: false,
    );
  }

  void showKeyboard() {
    focusNode.requestFocus();
  }

  void openKeyboard() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void dismissKeyboard() {
    // focusNode.unfocus();
    FocusScope.of(context).unfocus();
  }

  _fieldFocusChange(
    BuildContext context,
    FocusNode currentFocus,
    FocusNode nextFocus,
  ) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}

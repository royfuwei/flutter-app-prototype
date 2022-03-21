import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/core/common/components/default_button.dart';
import 'package:seeks_app_prototype/core/login/pages/login.page.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class SplashData {
  SplashData(this.text, this.image);
  String text, image;
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<SplashData> splashData = [
    SplashData("Welcome to Travel Note, Let’s plan a travel!",
        "assets/images/splash_1.jpg"),
    SplashData(
        "We show the easy way to plan travel.", "assets/images/splash_2.jpg"),
    SplashData("Just start traveling with us!", "assets/images/splash_3.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // width: double.infinity,
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (value) => {
                setState(() {
                  currentPage = value;
                })
              },
              itemCount: splashData.length,
              itemBuilder: (context, index) => SplashContent(
                image: splashData[index].image,
                text: splashData[index].text,
              ),
            ),
          ),
          Padding(
            // padding: EdgeInsets.fromLTRB(
            //   getProportionateScreenWidth(25),
            //   getProportionateScreenWidth(25),
            //   getProportionateScreenWidth(25),
            //   getProportionateScreenWidth(30),
            // ),
            padding: EdgeInsets.all(
              getProportionateScreenWidth(context, 25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    splashData.length,
                    (index) => buildDot(index: index),
                  ),
                ),
                VerticalSpacing(of: 40),
                DefaultButton(
                  text: getButtonText(),
                  press: () {
                    Navigator.pushNamed(context, LoginPage.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  String getButtonText() {
    if (currentPage == splashData.length - 1) {
      return "Continue";
    } else {
      return "Skip";
    }
  }
}

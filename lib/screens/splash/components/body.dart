import 'package:flutter/material.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/components/default_button.dart';
import 'package:seeks_flutter/screens/login/login_screen.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/screens/splash/components/splash_content.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text": "Welcome to Travel Note, Let’s plan a travel!",
      "image": "assets/images/splash_1.jpg"
    },
    {
      "text": "We show the easy way to plan travel.",
      "image": "assets/images/splash_2.jpg"
    },
    {
      "text": "Just start traveling with us!",
      "image": "assets/images/splash_3.jpg"
    },
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
                image: splashData[index]["image"],
                text: splashData[index]["text"],
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
              getProportionateScreenWidth(25),
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
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AnimatedContainer buildDot({int index}) {
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

import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/constants.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

class SplashContent extends StatelessWidget {
  final String text, image;
  const SplashContent({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VerticalSpacing(
          of: 25,
        ),
        Text(
          "Travel Note",
          style: TextStyle(
              fontSize: getProportionateScreenWidth(context, 36),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold),
        ),
        VerticalSpacing(
          of: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(context, 20),
          ),
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              color: kTextColor,
              height: 1.5,
              fontSize: getProportionateScreenWidth(context, 16),
            ),
          ),
        ),
        VerticalSpacing(of: 40),
        Image.asset(
          image,
          height: getProportionateScreenHeight(context, 400),
          width: double.infinity,
        ),
      ],
    );
  }
}

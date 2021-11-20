import 'package:flutter/material.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/configs/size_config.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final void Function()? press;
  final Color color;
  final Color bgButtonColor;
  final bool isElevation;

  const DefaultButton({
    // button onPressed 的方法透過建構傳入
    Key? key,
    required this.text,
    this.press,
    this.color = Colors.white,
    this.bgButtonColor = kPrimaryColor,
    this.isElevation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(context, 48),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          elevation: isElevation
              ? MaterialStateProperty.all(8.0)
              : MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(bgButtonColor),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(context, 18),
            color: color,
          ),
        ),
      ),
    );
  }
}

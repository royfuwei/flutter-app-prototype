import 'package:flutter/material.dart';
import 'package:seeks_flutter/constants.dart';
import 'package:seeks_flutter/configs/size_config.dart';

class DefaultButton extends StatelessWidget {
  final String text;
  final void Function() press;

  const DefaultButton({
    // button onPressed 的方法透過建構傳入
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(context, 56),
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )),
          backgroundColor: MaterialStateProperty.all(kPrimaryColor),
        ),
        onPressed: press,
        child: Text(
          text,
          style: TextStyle(
            fontSize: getProportionateScreenWidth(context, 18),
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

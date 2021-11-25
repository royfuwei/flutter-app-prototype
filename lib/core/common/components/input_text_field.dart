import 'package:flutter/material.dart';
import 'package:seeks_flutter/configs/size_config.dart';
import 'package:seeks_flutter/constants.dart';

class InputTextField extends StatelessWidget {
  final String title;
  final String subTitle;
  final String hintText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  const InputTextField({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.hintText,
    this.keyboardType: TextInputType.text,
    this.textInputAction: TextInputAction.done,
    this.textAlign: TextAlign.start,
    this.onChanged,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(context, 8),
              vertical: getProportionateScreenHeight(context, 0),
            ),
            child: Text(
              title,
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(0),
            child: textFieldSide(
              context,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(context, 8),
              vertical: getProportionateScreenHeight(context, 0),
            ),
            child: Text(
              subTitle,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  switchFieldType() {}

  textFieldSide(BuildContext context) {
    return SizedBox(
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
        child: TextFormField(
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          textAlign: textAlign,
          onChanged: onChanged,
          onSaved: onSaved,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: hintText,
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
    );
  }
}

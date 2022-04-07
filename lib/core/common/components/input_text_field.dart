import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class InputTextField extends StatelessWidget {
  final String title;
  final String subTitle;
  final String hintText;
  final String? initialValue;
  final String? errorText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextAlign textAlign;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final TextEditingController? textEditingController;
  const InputTextField({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.hintText,
    this.textEditingController,
    this.errorText = "",
    this.initialValue,
    this.keyboardType: TextInputType.text,
    this.textInputAction: TextInputAction.done,
    this.textAlign: TextAlign.start,
    this.onChanged,
    this.onTap,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bodyFieldTitle(context),
          bodyTextFieldSide(context),
          bodyFieldSubTitle(context),
        ],
      ),
    );
  }

  bodyFieldSubTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(context, 8),
        vertical: getProportionateScreenHeight(context, 0),
      ),
      child: Text(
        subTitle,
        textAlign: TextAlign.start,
      ),
    );
  }

  bodyFieldTitle(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(context, 8),
        vertical: getProportionateScreenHeight(context, 0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
          ),
          Text(
            errorText!,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  bodyTextFieldSide(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(0),
      child: textFieldSide(
        context,
      ),
    );
  }

  textFieldSide(BuildContext context) {
    return Container(
      width: double.infinity,
      height: getProportionateScreenHeight(context, 48),
      child: Card(
        elevation: 1.0,
        color: colorTextField,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ), //设置圆角
        child: textFormField(context),
      ),
    );
  }

  textFormField(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      controller: textEditingController,
      cursorColor: keyboardType == TextInputType.none ? null : Colors.white12,
      // cursorColor: Colors.white12,
      cursorWidth: 1,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textAlign: textAlign,
      onChanged: onChanged,
      onSaved: onSaved,
      onTap: onTap,
      // onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        // errorText: errorText,
        border: OutlineInputBorder(),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: getProportionateScreenWidth(
            context,
            18,
          ),
          color: Colors.white60,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class LoginTelTextFieldComponent extends StatelessWidget {
  const LoginTelTextFieldComponent({
    Key? key,
    this.fieldTelOnChanged,
    this.focusNode,
    this.controller,
  }) : super(key: key);
  final void Function(String)? fieldTelOnChanged;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return _contentTextFieldSide(context);
  }

  _contentTextFieldSide(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(context, 48),
        child: Container(
          decoration: BoxDecoration(
            color: colorTextField,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: TextField(
            textAlign: TextAlign.start,
            cursorColor: Colors.white12,
            cursorWidth: 1,
            keyboardType: TextInputType.phone,
            controller: controller,
            focusNode: focusNode,
            textInputAction: TextInputAction.done,
            onChanged: fieldTelOnChanged,
            decoration: InputDecoration(
              // filled: true,
              // fillColor: colorTextField,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              border: InputBorder.none,
              hintText: "填寫手機號碼",
              hintStyle: TextStyle(
                fontSize: getProportionateScreenWidth(
                  context,
                  18,
                ),
                color: Colors.white60,
              ),
              contentPadding: EdgeInsets.only(
                left: 16,
                right: 16,
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
}

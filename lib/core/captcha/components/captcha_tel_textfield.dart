import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/constants.dart';

class CaptchaTelTextFieldComponent extends StatelessWidget {
  const CaptchaTelTextFieldComponent({
    Key? key,
    this.focusNode,
    this.fieldCaptchOnChanged,
    this.textEditingController,
  }) : super(key: key);
  final FocusNode? focusNode;
  final void Function(String)? fieldCaptchOnChanged;
  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(context, 24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _textFieldSide(context),
        ],
      ),
    );
  }

  _textFieldSide(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: double.infinity,
        height: getProportionateScreenHeight(context, 48),
        child: Container(
          // elevation: 0.0,
          decoration: BoxDecoration(
            color: colorTextField,
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: TextField(
            controller: textEditingController,
            cursorColor: Colors.white12,
            cursorWidth: 1,
            keyboardType: TextInputType.number,
            focusNode: focusNode,
            textInputAction: TextInputAction.done,
            textAlign: TextAlign.center,
            onChanged: fieldCaptchOnChanged,
            decoration: InputDecoration(
              border: InputBorder.none,
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
              hintText: "輸入驗證碼",
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
          ),
        ),
      ),
    );
  }
}

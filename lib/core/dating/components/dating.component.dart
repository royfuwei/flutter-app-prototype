import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/dating/widgets/dating_label.widget.dart';

getDatingLabelWidget({String title = "", required IconData icon}) {
  return Container(
    padding: EdgeInsets.only(right: 0),
    child: DatingLabelWidget(
      icon: icon,
      title: title,
    ),
  );
}

getTextDatingTextField({
  required BuildContext context,
  String title = "",
  String hintText = "",
  String? errorText,
  int? maxLines,
  int? minLines,
  FocusNode? focusNode,
  TextEditingController? controller,
  void Function(String)? onChanged,
  void Function()? onTap,
  TextInputAction? textInputAction = TextInputAction.done,
  TextInputType? keyboardType = TextInputType.name,
}) {
  return Container(
    padding: EdgeInsets.only(top: 0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(
                    context,
                    getProportionateScreenHeight(context, 18),
                  ),
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          child: datingTextField(
            context: context,
            onChanged: onChanged,
            onTap: onTap,
            controller: controller,
            errorText: errorText,
            title: title,
            hintText: hintText,
            maxLines: maxLines,
            minLines: minLines,
            textInputAction: textInputAction,
            focusNode: focusNode,
            keyboardType: keyboardType,
          ),
        ),
      ],
    ),
  );
}

datingTextField({
  required BuildContext context,
  String title = "",
  String hintText = "",
  String? errorText,
  int? maxLines,
  int? minLines,
  FocusNode? focusNode,
  TextEditingController? controller,
  void Function(String)? onChanged,
  void Function()? onTap,
  TextInputAction? textInputAction = TextInputAction.done,
  TextInputType? keyboardType = TextInputType.name,
}) {
  return TextField(
    onChanged: onChanged,
    onTap: onTap,
    controller: controller,
    focusNode: focusNode,
    // expands: true,
    maxLines: maxLines,
    minLines: minLines,
    textInputAction: textInputAction,
    cursorColor: Colors.black,
    style: TextStyle(
      fontSize: getProportionateScreenWidth(
        context,
        getProportionateScreenHeight(context, 16),
      ),
      color: Colors.black,
    ),
    keyboardType: keyboardType,
    decoration: InputDecoration(
      isDense: true,
      enabledBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorBorder: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      border: UnderlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: getProportionateScreenWidth(
          context,
          getProportionateScreenHeight(context, 16),
        ),
        color: Colors.grey,
      ),
      floatingLabelStyle: TextStyle(
        fontSize: getProportionateScreenWidth(
          context,
          getProportionateScreenHeight(context, 16),
        ),
        color: Colors.black,
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      errorText: errorText,
    ),
  );
}

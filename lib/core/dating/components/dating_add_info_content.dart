import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';
import 'package:seeks_app_prototype/core/dating/components/dating.component.dart';

class DatingAddInfoContentComponent extends StatelessWidget {
  const DatingAddInfoContentComponent({
    Key? key,
    this.contentFocusNode,
    this.controller,
    this.onChanged,
    this.onTap,
  }) : super(key: key);

  final FocusNode? contentFocusNode;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return body(context);
  }

  body(BuildContext context) {
    return bodyDatingContent(context);
  }

  bodyDatingContent(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: bodyTextDatingTextFieldScrollView(
        context: context,
        title: "約會描述",
        hintText: "填寫關於這場約會的描述... (>10字)",
        focusNode: contentFocusNode,
        textInputAction: TextInputAction.newline,
      ),
    );
  }

  bodyTextDatingTextFieldScrollView({
    required BuildContext context,
    String title = "",
    String hintText = "",
    String? errorText,
    int? maxLines,
    int? minLines,
    FocusNode? focusNode,
    TextInputAction? textInputAction = TextInputAction.newline,
    TextInputType? keyboardType = TextInputType.multiline,
  }) {
    return Container(
      // constraints: BoxConstraints(minHeight: 80),
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
                textInputAction == TextInputAction.newline &&
                        focusNode!.hasFocus
                    ? Text(
                        "完成",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(
                            context,
                            getProportionateScreenHeight(context, 16),
                          ),
                          color: Colors.blue,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
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
          ),
        ],
      ),
    );
  }
}

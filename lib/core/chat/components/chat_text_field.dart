import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:seeks_app_prototype/configs/size_config.dart';

class ChatTextFieldComponent extends StatefulWidget {
  const ChatTextFieldComponent({
    Key? key,
    this.bottomSideAlignment: CrossAxisAlignment.center,
    this.textEditingController,
    this.focusNode,
    this.textFieldMaxHeight = 36,
    this.sendOnPressed,
    this.addOnPressed,
    this.emojiOnPressed,
  }) : super(key: key);
  final CrossAxisAlignment bottomSideAlignment;
  final TextEditingController? textEditingController;
  final FocusNode? focusNode;
  final double textFieldMaxHeight;
  final void Function()? sendOnPressed;
  final void Function()? addOnPressed;
  final void Function()? emojiOnPressed;

  @override
  State<ChatTextFieldComponent> createState() => _ChatTextFieldComponentState();
}

class _ChatTextFieldComponentState extends State<ChatTextFieldComponent> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  body() {
    return bodyChatBottomSide();
  }

  bodyChatBottomSide() {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 10),
        width: double.infinity,
        color: Colors.white,
        child: Row(
          crossAxisAlignment: widget.bottomSideAlignment,
          children: <Widget>[
            bodyChatBottomIconButton(
              icon: Icon(
                Icons.add,
                color: Colors.blue,
                size: getProportionateScreenHeight(context, 34),
              ),
              onPressed: widget.addOnPressed,
            ),
            bodyChatBottomIconButton(
              icon: Icon(
                Icons.emoji_emotions_outlined,
                color: Colors.blue,
                size: getProportionateScreenHeight(context, 34),
              ),
              onPressed: widget.emojiOnPressed,
            ),
            bodyChatBottomTextField(),
            bodyChatBottomIconButton(
              icon: Icon(
                Icons.send,
                color: Colors.blue,
                size: getProportionateScreenHeight(context, 34),
              ),
              onPressed: widget.sendOnPressed,
            ),
          ],
        ),
      ),
    );
  }

  bodyChatBottomIconButton({Icon? icon, void Function()? onPressed}) {
    return Container(
      height: 40,
      child: TextButton(
        onPressed: onPressed,
        child: icon != null
            ? icon
            : Icon(
                Icons.send,
                color: Colors.blue,
                size: getProportionateScreenHeight(context, 40),
              ),
      ),
    );
  }

  bodyChatBottomTextField() {
    return Expanded(
      child: Container(
        constraints: BoxConstraints(
          minHeight: 36,
          maxHeight: widget.textFieldMaxHeight,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: TextField(
          controller: widget.textEditingController,
          maxLines: null,
          focusNode: widget.focusNode,
          textInputAction: TextInputAction.newline,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "輸入訊息",
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.only(
              left: 16,
              top: 8,
              bottom: 8,
              right: 16,
            ),
          ),
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
